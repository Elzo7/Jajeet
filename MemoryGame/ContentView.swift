import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoGameViewModel = MemoGameViewModel()
    
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
        .foregroundColor(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: MemoGameViewModel())
    }
}
