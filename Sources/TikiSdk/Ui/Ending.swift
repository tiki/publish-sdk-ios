import SwiftUI

public struct Ending: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    /// A `Text` title to be shown in the top of the bottom sheet.
    let title: AnyView
    
    /// The center message of the ending screen.
    let message: String
    
    /// The sub text shown below the message.
    let footnote: AnyView
    
    var primaryTextColor: Color?
    var backgroundColor: Color?
    var fontFamily: String?
    
    /// Ending Builder
    ///
    /// `TikiSdk.theme` is used for default styling.
    public init(title: AnyView, message: String, footnote: AnyView, primaryTextColor: Color? = nil, backgroundColor: Color? = nil, fontFamily: String? = nil) {
        self.title = title
        self.message = message
        self.footnote = footnote
        self.primaryTextColor = primaryTextColor
        self.backgroundColor = backgroundColor
        self.fontFamily = fontFamily
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 0){
            title
                .padding(.top, 28)
            Text(message)
                .font(.custom(fontFamily ?? TikiSdk.theme(colorScheme).fontMedium, size: 32))
                .foregroundColor(primaryTextColor  ?? TikiSdk.theme(colorScheme).primaryTextColor)
                .padding(.vertical,36)
            footnote
                .padding(.bottom, 50)
        }
        .frame(maxWidth: .infinity)
        .background(backgroundColor ?? TikiSdk.theme(colorScheme).primaryBackgroundColor)
    }
}

struct YourChoice: View{
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View{
        HStack(spacing: 0){
            Text("YOUR ")
                .font(.custom(TikiSdk.theme(colorScheme).fontBold, size:20))
                .foregroundColor(TikiSdk.theme(colorScheme).accentColor)
            Text("CHOICE")
                .font(.custom(TikiSdk.theme(colorScheme).fontBold, size: 20))
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct Whoops: View{
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View{
        HStack(spacing: 0){
            Text("WHOOPS").font(.custom(TikiSdk.theme(colorScheme).fontBold, size: 20))
                .foregroundColor(Color(red:0.78, green: 0.18, blue: 0))
        }.frame(maxWidth: .infinity, alignment: .center)
    }
}
