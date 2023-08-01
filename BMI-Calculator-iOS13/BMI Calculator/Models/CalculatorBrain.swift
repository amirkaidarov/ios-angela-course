//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Амир Кайдаров on 12/17/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain{
    var bmi : BMI?
        
    func getFormattedHeight(_ value : Float) -> String{
        return String(format: "%.2fm", value)
    }
    
    func getFormattedWeight(_ value : Float) -> String{
        return String(format: "%.0fKg", value)
    }
    
    mutating func calculateBMI(height : Float, weight : Float) {
        self.bmi = BMI(value : weight / pow(height, 2))
    }
    
    func getFormattedBMIValue() -> String{
        return String(format: "%.1f", self.bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String{
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor.white
    }
}
