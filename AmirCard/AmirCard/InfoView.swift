//
//  InfoView.swift
//  AmirCard
//
//  Created by Амир Кайдаров on 12/25/22.
//

import SwiftUI

struct InfoView: View {
    let text : String
    let icon : String
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 50, alignment: .center)
            .foregroundColor(Color.white)
            .overlay(HStack {
                Image(systemName: icon)
                    .foregroundColor(Color.green)
                Text(text)
            })
            .padding()
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text : "hello", icon : "phone.fill").previewLayout(.sizeThatFits)
    }
}
