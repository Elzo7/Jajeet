import SwiftUI

struct ThemeButtonView: View {
    let theme: Theme
    @Binding var selectedTheme: Theme
    var onTap: () -> Void
    
    var body: some View {
        Button(action: {
            onTap()
        }) {
            VStack {
                Image(systemName: theme.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text(theme.title)
                    .font(.footnote)
            }
            .foregroundColor(theme.color)
            .padding(8)
        }
    }
}

struct ThemeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeButtonView(theme: .emojis, selectedTheme: .constant(.emojis), onTap: {})
    }
}
