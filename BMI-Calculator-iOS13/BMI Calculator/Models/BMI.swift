//
//  BMI.swift
//  BMI Calculator
//
//  Created by Амир Кайдаров on 12/17/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct BMI {
    let value : Float
    let advice : String
    let color : UIColor
    
    init(value : Float) {
        self.value = value
        if value < 19.5 {
            self.advice = "Eat more pies!"
            self.color = UIColor(red: 0.009, green: 0.450, blue: 0.683, alpha: 1)
        } else if value < 24.9 {
            self.advice = "Fit as a fiddle!"
            self.color = UIColor(red: 0.176, green: 0.514, blue: 0.318, alpha: 1)
        } else {
            self.advice = "Eat less pies!"
            self.color = UIColor(red: 0.827, green: 0.255, blue: 0.357, alpha: 1)
        }
    }
}
