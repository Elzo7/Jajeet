import SwiftUI

struct Theme: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var icon: String
    var cardColor: Color
    var emojis: [String]
}

let themes: [Theme] = [
    Theme(name: "Animals", icon: "ant", cardColor: .green, emojis: ["🦁", "🐻", "🦊", "🐼", "🦁", "🐻", "🦊", "🐼"]),
    Theme(name: "Fruits", icon: "applelogo", cardColor: .orange, emojis: ["🍎", "🍉", "🥝", "🥥", "🍓", "🍎", "🍉", "🥝", "🥥", "🍓"]),
    Theme(name: "Flags", icon: "flag", cardColor: .blue, emojis: ["🇵🇱", "🇵🇹", "🇳🇱", "🇳🇴", "🇮🇹", "🇫🇷", "🇵🇱", "🇵🇹", "🇳🇱", "🇳🇴", "🇮🇹", "🇫🇷"])
]
