//
//  WebView.swift
//  H4XOR News
//
//  Created by Амир Кайдаров on 12/26/22.
//

import Foundation
import WebKit
import SwiftUI

struct WebView : UIViewRepresentable {
    typealias UIViewType = WKWebView
    
    let urlString : String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let urlString = urlString, let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
    
}
