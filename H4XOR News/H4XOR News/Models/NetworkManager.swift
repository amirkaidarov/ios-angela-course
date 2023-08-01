//
//  NetworkManager.swift
//  H4XOR News
//
//  Created by Амир Кайдаров on 12/26/22.
//

import Foundation


class NetworkManger : ObservableObject {
    @Published var posts = [Post]()
    func fetch() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let data = data {
                        do {
                            let results = try decoder.decode(Results.self, from: data)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
