//
//  ContentView.swift
//  H4XOR News
//
//  Created by Амир Кайдаров on 12/26/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManger()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(
                    destination: DetailView(urlString: post.url)
                ) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            //.listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text("H4XOR News")
                        .font(.system(size: 35))
                }})
        }.onAppear {
            networkManager.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
