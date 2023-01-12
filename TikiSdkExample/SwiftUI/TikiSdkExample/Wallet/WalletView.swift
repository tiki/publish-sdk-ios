/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI
import TikiSdk

struct WalletView: View {
    
    @State private var tikiSdkArray: [TikiSdk] = []
    @State private var isLoading = false
    
    var body: some View {
        VStack{
            NavigationView{
                VStack{
                  Text("Wallets")
                    List {
                        ForEach(0..<tikiSdkArray.count, id: \.self) { index in
                            let tikiSdk = tikiSdkArray[index]
                            let addr = tikiSdk.address!.prefix(16)
                            NavigationLink(destination: StreamListView(tikiSdk: tikiSdk)) {
                                Text(addr + "...")
                            }
                        }
                        Button("+ new wallet") {
                            if(!isLoading){
                                isLoading = true
                                Task {
                                    let origin = "com.mytiki.tiki_sdk_example"
                                    let apiId = "2b8de004-cbe0-4bd5-bda6-b266d54f5c90"
                                    let tikiSdk = try await TikiSdk(origin: origin, apiId: apiId)
                                    tikiSdkArray.append(tikiSdk)
                                    isLoading = false
                                }
                            }
                        }.disabled(isLoading)
                    }
                }
            }
        }
    }
    

}

