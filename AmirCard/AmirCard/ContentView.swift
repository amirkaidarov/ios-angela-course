//
//  ContentView.swift
//  AmirCard
//
//  Created by Амир Кайдаров on 12/23/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.63, blue: 0.52)
                .ignoresSafeArea()
            VStack {
                Image("image")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 140, height: 140, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                Text("Amir Kaidarov")
                    .bold()
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .foregroundColor(Color.white)
                Text("iOS Developer")
                    .font(.system(size: 25))
                    .foregroundColor(Color.white)
                Divider()
                InfoView(text: "+1 215 594 9237", icon: "phone.fill")
                InfoView(text: "amk536@drexel.edu", icon: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView() 
    }
}
