/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import Foundation

struct ReqReceiptAll: Req {
    var payableId: String
    var requestId: String?
    
    func asDictionary() -> [String : Any?] {
        return [
            "payableId": payableId,
            "requestId": requestId
        ]
    }
}
