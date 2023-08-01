//
//  ContentView.swift
//  I am Rich 2
//
//  Created by Амир Кайдаров on 12/23/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(.systemTeal).ignoresSafeArea(.all)
            VStack {
                Text("I am Rich")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Image("diamond")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
