import SwiftUI

@main
struct MemoryGameApp: App {
    @StateObject var game = MemoGameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
