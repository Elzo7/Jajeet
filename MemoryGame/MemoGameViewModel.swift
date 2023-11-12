import SwiftUI

class MemoGameViewModel: ObservableObject {
    private static let emojis = ["🦁", "🐻", "🦊", "🐼", "🦁", "🐻", "🦊", "🐼"]
    
    private static func createMemoryGame() -> MemoGameModel<String> {
        return MemoGameModel(numberOfPairsOfCards: 16) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "❓❓"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoGameModel<String>.Card> {
        return model.cards
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoGameModel<String>.Card) {
        model.choose(card)
    }
}
