/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import Foundation

struct ReqSign: Req {
    var requestId: String?
    let keyId: String?
    let message: Data
    
    func asDictionary() -> [String : Any?] {
        return [
            "requestId" : requestId,
            "keyId" : keyId,
            "message" : message.base64EncodedString(),
        ]
    }
}
