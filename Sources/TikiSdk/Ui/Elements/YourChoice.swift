/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import SwiftUI

struct YourChoice: View{
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View{
        HStack(spacing: 0){
            Text("YOUR ")
                .font(.custom(TikiSdk.theme(colorScheme).fontBold, size:20))
                .foregroundColor(TikiSdk.theme(colorScheme).accentColor)
            Text("CHOICE")
                .font(.custom(TikiSdk.theme(colorScheme).fontBold, size: 20))
                .foregroundColor(TikiSdk.theme(colorScheme).primaryTextColor)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}
