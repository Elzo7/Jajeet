import SwiftUI

struct ThemeButtonView: View {
    let theme: Theme
    @Binding var selectedTheme: Theme
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            VStack {
                Image(systemName: theme.icon)
                    .font(.title)
                Text(theme.name)
                    .font(.caption)
            }
            .onTapGesture {
                selectedTheme = theme
            }
            .padding()
            .foregroundColor(theme.cardColor)
        }
        
    }
}

struct ThemeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeButtonView(theme: Theme(name: "Animals", icon: "ant", cardColor: .green, emojis: [""]), selectedTheme: .constant(Theme(name: "Animals", icon: "ant", cardColor: .green, emojis: [""])), action: {})
    }
}
