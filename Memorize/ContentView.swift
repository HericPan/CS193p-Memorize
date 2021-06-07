//
//  ContentView.swift
//  Memorize
//
//  Created by Heric on 2021/6/1.
//

import SwiftUI

struct ContentView: View {
    var emojis: [String] = ["🚠","🚟","🚃","🚅", "🌪", "⛈", "🪛", "🔩", "🚬", "💈", "💊", "💉", "📂", "📖", "🖋", "🖍", "🈚️", "🉑" , ]
    @State var emojiCount: Int = 4;
    var body: some View {
        VStack{
            HStack {
                if emojiCount >= 0{
                    ForEach(emojis[0..<emojiCount], id: \.self, content:{ emoji in
                        CardView(content: emoji)
                    })
                }
            }
            
           HStack {
                add
                Spacer()
                remove
           }.padding(.horizontal)
        }.foregroundColor(.red).padding()
    }
    
    var add: some View {
        Button(action: {
            if emojiCount < emojis.count {
                    emojiCount += 1;
                }
            }, label: {
                VStack {
                    Text("Add")
                    Text("Card")
            }
        })
    }
    
    var remove: some View {
        Button(action: {
            emojiCount -= 1;
            }, label: {
            VStack{
                Text("Remove")
                Text("Card")
            }
            })
    }
}

struct CardView: View {
    var content: String;
    @State var isFaceUp: Bool = true;
    var body: some View {
        
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25)
            if isFaceUp{
                
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                
                Text(content).font(.largeTitle)
            } else {
                shape
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp;
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
