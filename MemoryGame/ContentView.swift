import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoGameViewModel
    
    var body: some View {
        VStack {
            Text("Memo")
                .font(.largeTitle)
            
            ScrollView{
                cardDisplay
                    .animation(.default, value: viewModel.cards)
            }
            
            Button("SHUFFLE"){
                viewModel.shuffle()
            }
            
            themeButtons
        }
        .padding()
    }
    
    var cardDisplay : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0){
            ForEach(viewModel.cards){ card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(viewModel.themeColor)
    }
    
    var themeButtons: some View {
        HStack {
            ThemeButtonView(themeName: "Emojis", themeImage: "face.smiling", viewModel: viewModel)
            Spacer()
            ThemeButtonView(themeName: "Food", themeImage: "applelogo", viewModel: viewModel)
            Spacer()
            ThemeButtonView(themeName: "Animals", themeImage: "ant", viewModel: viewModel)
        }
    }
}


#Preview {
    ContentView(viewModel: MemoGameViewModel())
}
