/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import Flutter
import FlutterPluginRegistrant

/// The definition of Flutter Platform Channels for TIKI SDK
public class Channel {
    
    private var channel: FlutterMethodChannel?
    
    static let channelId = "tiki_sdk_flutter"
    var callbacks: Dictionary<String, ((_ jsonString : String?, _ error : Error?) -> Void)> = [:]
    
    /// Handles the method calls from Flutter.
    ///
    /// When calling TIKI SDK Flutter from native code, one should pass a requestId
    /// that will identify to which request the response belongs to.
    /// All the calls are asynchronous and should be treated like this.
    public func handle(call: FlutterMethodCall, result: @escaping FlutterResult){
        guard let requestId : String = (call.arguments as? Dictionary<String, Any>)?["requestId"] as? String else {
            result(FlutterError.init(code: "400", message: "Bad Request", details: ["arguments" : call.arguments, "description" : "Missing requestId"]))
            return
        }
        let response: String = (call.arguments as? Dictionary<String, Any>)?["response"] as? String ?? ""
        switch (call.method) {
        case "success" :
            let callback = callbacks[requestId]!
            callback(response, nil)
            break
        case "error" :
            do{
                let rspError = try JSONDecoder().decode(RspError.self, from:  Data(response.utf8))
                callbacks[requestId]?(nil, TikiSdkError(message: rspError.message, stackTrace: rspError.stackTrace))
            }catch{
                callbacks[requestId]?(nil, TikiSdkError(message: error.localizedDescription, stackTrace: Thread.callStackSymbols.joined(separator: "\n")))
            }
            break
        default :
            result(FlutterError(code: "404", message: "Not Found", details: call.arguments))
            callbacks[requestId]?(nil, TikiSdkError(message: "Unimplemented method", stackTrace: Thread.callStackSymbols.joined(separator: "\n")))
        }
        callbacks.remove(at: callbacks.index(forKey: requestId)!)
    }
    
    public func initChannel() async {
        let flutterEngine: FlutterEngine = FlutterEngine(name: "tiki_sdk_flutter_engine")
        await withCheckedContinuation{ continuation in
            DispatchQueue.main.sync {
                flutterEngine.run()
                GeneratedPluginRegistrant.register(with: flutterEngine);
                self.channel = FlutterMethodChannel.init(name: Channel.channelId, binaryMessenger: flutterEngine as! FlutterBinaryMessenger)
                self.channel!.setMethodCallHandler(self.handle)
                continuation.resume()
            }
        }
    }
    
    public func invokeMethod<T: Decodable, R: Encodable>(
        method: ChannelMethod,
        request: R,
        continuation: CheckedContinuation<T, Error>
    ) throws -> Void {
        let requestId = UUID().uuidString
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .millisecondsSince1970
        let jsonData = try encoder.encode(request)
        let jsonRequest = String(data: jsonData, encoding: String.Encoding.utf8)
        callbacks[requestId] = { jsonString, err in
            if(err != nil){
                continuation.resume(throwing: err!)
            }
            do{
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .millisecondsSince1970
                let rsp: T = try decoder.decode(T.self, from: Data(jsonString!.utf8))
                continuation.resume(returning: rsp)
            }catch{
                continuation.resume(throwing: error)
            }
        }
        Task{
            if(channel == nil){
                await initChannel()
            }
            channel!.invokeMethod(
                method.value(), arguments: [
                    "requestId" : requestId,
                    "request" : jsonRequest
                ]
            )
        }
    }
}
    
