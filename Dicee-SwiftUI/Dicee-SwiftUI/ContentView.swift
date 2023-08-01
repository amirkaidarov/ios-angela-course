//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Амир Кайдаров on 12/25/22.
//

import SwiftUI

struct ContentView: View {
    let font = Font
        .system(size: 40)
        .weight(.heavy)
    
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(number: leftDiceNumber)
                    DiceView(number: rightDiceNumber)
                }
                .padding(.horizontal )
                Spacer()
                Button("Roll") {
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                }
                .font(font)
                .foregroundColor(Color.white)
                .padding(.horizontal)
                .background(Color.red)
            }
        }
    }
}

struct DiceView: View {
    let number : Int
    var body: some View {
        Image("dice\(number)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
