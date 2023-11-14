import SwiftUI

struct ThemeButtonView: View {
    let themeName: String
    let themeImage: String
    @ObservedObject var viewModel: MemoGameViewModel
    var body: some View {
        Button(action: {
            viewModel.selectedTheme = themeName
            viewModel.changeTheme()
            //viewModel.shuffle()
        }) {
            VStack {
                Image(systemName: themeImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text(themeName)
                    .font(.footnote)
            }
        }
        .foregroundColor(viewModel.themeColor)
        .padding(8)
    }
    
}

#Preview {
    ThemeButtonView(themeName: "Emojis", themeImage: "face.smiling", viewModel: MemoGameViewModel())
}
