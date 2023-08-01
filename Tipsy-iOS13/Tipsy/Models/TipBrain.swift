//
//  TipBrain.swift
//  Tipsy
//
//  Created by Амир Кайдаров on 12/18/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct TipBrain {
    var tip : Int?
    
    var totalPerPerson : Float?
    
    mutating func setTotalPerPerson(total totalString : String?, numberOfPeople numberOfPeopleString : String?) {
        let total = Float(totalString ?? "0") ?? 0.0
        let tipAmount = total * (Float(tip ?? 0) / 100)
        let numberOfPeople = Float(numberOfPeopleString!)!
        totalPerPerson = (total + tipAmount) / numberOfPeople
    }
    
    func getTip() -> Int {
        return tip ?? 0
    }
}
