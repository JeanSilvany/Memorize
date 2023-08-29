//
//  ContentView.swift
//  Memorize
//
//  Created by Jean Silvany on 28/08/23.
//

import SwiftUI

struct ContentView: View {
    var emojis = [
        "😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣",
        "😊", "😇", "😍", "🥰", "😘", "😗", "😙", "😚",
        "😎", "🤓", "😛", "😜", "😝", "🤪", "😏", "😌"
    ];
    @State var emojiCount = 4
    
    var body: some View {
        let remove: some View = Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
        
        let add: some View = Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label : {
            Image(systemName: "plus.circle")
        }
        
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { item in
                        CardView(content: item).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
          .foregroundColor(.red)
            
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }.padding(.horizontal)
                .font(.largeTitle)
        }
        .padding(.horizontal)
        
    }
    
}



struct CardView: View {
    @State var isFaceUp: Bool = false
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
