//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Амир Кайдаров on 12/19/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    let rate : Double
    var rateString : String {
        return String(format: "%.2f", rate)
    }
}
