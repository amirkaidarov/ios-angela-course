//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateRate(_ coinManager : CoinManager, coin: CoinModel)
    func didFailWithError(_ error : Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "D518B266-BB47-4729-BC9E-C6F3C0B436FB"
    
    var delegate : CoinManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func fetchBitcoinValue(_ currency : String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error!)
                    return
                }
                
                if let safeData = data {
                    if let coin = parseJSON(safeData) {
                        delegate?.didUpdateRate(self, coin: coin)
                    }
                }
            }
            
            task.resume()
        }
        
    }
    
    func parseJSON(_ data : Data) -> CoinModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            
            let coin = CoinModel(rate : decodedData.rate)
            
            return coin
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
}
