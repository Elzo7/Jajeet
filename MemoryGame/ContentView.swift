import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoGameViewModel = MemoGameViewModel()
    @State private var selectedTheme: Theme = .emojis
    
    var body: some View {
        VStack {
            Text("Memo")
                .font(.largeTitle)
            ScrollView {
                cardDisplay
                    .animation(.default, value: viewModel.cards)
            }
            
            Button("SHUFFLE") {
                viewModel.shuffle()
            }
            
            themeButtons
        }
        .padding()
    }
    
    var cardDisplay: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(selectedTheme.color)
    }
    
    var themeButtons: some View {
        HStack {
            ThemeButtonView(theme: .emojis, selectedTheme: $selectedTheme) {
                updateTheme(theme: .emojis)
            }
            
            Spacer()
            
            ThemeButtonView(theme: .food, selectedTheme: $selectedTheme) {
                updateTheme(theme: .food)
            }
            
            Spacer()
            
            ThemeButtonView(theme: .animals, selectedTheme: $selectedTheme) {
                updateTheme(theme: .animals)
            }
        }
    }
    
    private func updateTheme(theme: Theme) {
        selectedTheme = theme
        viewModel.setTheme(emojis: selectedTheme.emojis, pairs: selectedTheme.numberOfPairs)
    }
}

enum Theme {
    case emojis, food, animals
    
    var title: String {
        switch self {
        case .emojis: return "Emojis"
        case .food: return "Food"
        case .animals: return "Animals"
        }
    }
    
    var icon: String {
        switch self {
        case .emojis: return "face.smiling"
        case .food: return "applelogo"
        case .animals: return "ant"
        }
    }
    
    var color: Color {
        switch self {
        case .emojis: return .blue
        case .food: return .red
        case .animals: return .green
        }
    }
    
    var emojis: [String] {
        switch self {
        case .emojis: return ["😇", "😎", "😃", "🙂", "🥳"]
        case .food: return ["🍔", "🍕", "🌮", "🍦", "🍎", "🥐"]
        case .animals: return ["🐶", "🐱", "🐰", "🐯", "🐵", "🐻", "🐸"]
        }
    }
    
    var numberOfPairs: Int {
        switch self {
        case .emojis: return 6
        case .food: return 7
        case .animals: return 8
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: MemoGameViewModel())
    }
}
