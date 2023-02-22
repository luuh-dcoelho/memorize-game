//
//  ContentView.swift
//  Memorize
//
//  Created by Lucas Coelho on 19/02/23.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🚗","🚕","🚙", "🚌", "🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","✈️","🚀","🚁","⛵️","🛳"]
    @State var emojiCount = 4
    
    var body:some View {
        VStack{
            Text("Memorize!")
                .font(
                    .system(size: 32))
                .fontWeight(.bold)
            if emojiCount > 16 {
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 67))]){
                        ForEach(emojis[0..<emojiCount], id: \.self){ emoji in
                            CardView(isFaceUp: true,content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                    .foregroundColor(.red)
                }
            } else{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 67))]){
                        ForEach(emojis[0..<emojiCount], id: \.self){ emoji in
                            CardView(isFaceUp: true,content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                    .foregroundColor(.red)
            }
            Spacer()
            HStack{
                transport
                Spacer()
                flags
                Spacer()
                fruits
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    var transport: some View{
        Button {
                emojis = ["🚗","🚕","🚙", "🚌", "🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","✈️","🚀","🚁","⛵️","🛳"]
                emojiCount = Int.random(in: 4..<emojis.count)
            } label: {
                VStack{
                    Image(systemName:"car")
                    Text("Vehicles").font(.system(size: 16))
                }
            }
    }
    var flags: some View{
        Button {
                emojis = ["🇩🇪", "🇿🇦","🇨🇦","🇧🇷","🇹🇩","🇪🇸","🇦🇺","🇦🇷","🇨🇮","🇰🇷","🇫🇮","🇬🇪","🇫🇷","🇯🇵","🇱🇷","🇵🇹","🇳🇴"]
                emojiCount = Int.random(in: 4..<emojis.count)
            } label: {
                VStack{
                    Image(systemName: "flag")
                    Text("Flags").font(.system(size: 16))
                }
        }
    }
    var fruits: some View{
        Button{
                emojis = ["🍎","🍊","🍐","🍌","🍉","🍇","🍓","🍅","🥝","🥑","🍒","🍍","🥥"]
                emojiCount = Int.random(in: 4..<emojis.count)
            } label: {
                VStack{
                    Image(systemName: "carrot")
                    Text("Fruits").font(.system(size: 16))
                }
        }
    }
}


struct CardView: View{
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)

            if(isFaceUp){
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            }else{
                shape
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
