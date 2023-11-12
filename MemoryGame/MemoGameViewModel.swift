import SwiftUI

class MemoGameViewModel: ObservableObject {
    private static var emojis: [String] = []
    
    private static func createMemoryGame(emojis: [String], pairs: Int) -> MemoGameModel<String> {
        return MemoGameModel(numberOfPairsOfCards: pairs) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "❓❓"
            }
        }
    }
    
    @Published private var model = createMemoryGame(emojis: Theme.emojis.emojis, pairs: Theme.emojis.numberOfPairs)
    
    var cards: Array<MemoGameModel<String>.Card> {
        return model.cards
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoGameModel<String>.Card) {
        model.choose(card)
    }
    
    func setTheme(emojis: [String], pairs: Int) {
        MemoGameViewModel.emojis = emojis
        model = MemoGameViewModel.createMemoryGame(emojis: emojis, pairs: pairs)
    }
}
