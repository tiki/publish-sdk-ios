/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import Foundation

struct ReqReceipt: Encodable, Req {
    var payableId: String
    var amount: String
    var description: String? = nil
    var reference: String? = nil
    var requestId: String?
}