import SwiftUI

struct UsedFor: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    let bullets: [UsedBullet]
    var primaryTextColor: Color? = nil
    var secondaryTextColor: Color? = nil
    var fontFamily: String? = nil

    init(bullets: [UsedBullet], primaryTextColor: Color? = nil, secondaryTextColor: Color? = nil, fontFamily: String? = nil ) {
        self.bullets = bullets
        self.primaryTextColor = primaryTextColor
        self.secondaryTextColor = secondaryTextColor
        self.fontFamily = fontFamily
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("HOW YOUR DATA WILL BE USED")
                .foregroundColor(primaryTextColor ?? TikiSdk.instance.getActiveTheme(colorScheme).primaryTextColor)
                .font(.custom(fontFamily ?? TikiSdk.instance.getActiveTheme(colorScheme).fontFamily, size: 16))
                .fontWeight(.bold).padding(.bottom, 5)
            ForEach(bullets, id: \.self) { item in
                HStack(alignment: .center) {
                    if item.isUsed {
                        Image("checkIcon")
                            .frame(width: 12, height: 12)
                    } else {
                        Image("xIcon")
                            .frame(width: 12, height: 12)
                    }
                    Text(item.text)
                        .foregroundColor(secondaryTextColor ?? TikiSdk.instance.getActiveTheme(colorScheme).getSecondaryTextColor)
                        .font(.custom(fontFamily ?? TikiSdk.instance.getActiveTheme(colorScheme).fontFamily, size: 16))
                        .fontWeight(.bold).padding(.bottom, 5)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 15)
        .padding(.top, 24)
        .padding(.bottom, 32)
    }
}
