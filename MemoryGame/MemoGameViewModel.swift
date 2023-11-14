import SwiftUI

class MemoGameViewModel: ObservableObject{
    private static var emojis = ["😇", "😎", "😃", "🙂", "🥳"]
    @Published private var model = createMemoGameModel()
    @Published var selectedTheme: String = "Emojis"

    
    private static func createMemoGameModel() -> MemoGameModel<String>{
        return MemoGameModel<String>(numberOfPairsOfCards: 7) { index in
            if emojis.indices.contains(index) {
                return emojis[index]
            } else {
                return "❓❓"
            }
        }
    }
    
    var cards: Array<MemoGameModel<String>.Card>{
        return model.cards
    }
    
    func shuffle(){
        model.shuffle()
    }
    
    func choose(_ card: MemoGameModel<String>.Card){
        model.choose(card)
    }
    
    func changeTheme() {
            switch selectedTheme {
            case "Food":
                MemoGameViewModel.emojis = ["🍔", "🍕", "🌮", "🍦", "🍎", "🥐"]
            case "Animals":
                MemoGameViewModel.emojis = ["🐶", "🐱", "🐰", "🐯", "🐵", "🐻", "🐸"]
            default:
                MemoGameViewModel.emojis = ["😇", "😎", "😃", "🙂", "🥳"]
            }
        model = MemoGameViewModel.createMemoGameModel()
    }
    
    var themeColor: Color {
            switch selectedTheme {
            case "Food": return .red
            case "Animals": return .green
            default: return .blue
            }
        }
    
}
