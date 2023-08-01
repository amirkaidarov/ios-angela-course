//
//  DetailView.swift
//  H4XOR News
//
//  Created by Амир Кайдаров on 12/26/22.
//

import SwiftUI

struct DetailView: View {
    let urlString : String?
    var body: some View {
        WebView(urlString: urlString)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(urlString: nil)
    }
}
