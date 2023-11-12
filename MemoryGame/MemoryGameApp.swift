import SwiftUI

@main
struct MemoryGameApp: App {
    @StateObject var memo = MemoGameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: memo)
        }
    }
}
