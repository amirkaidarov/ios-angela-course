//
//  CalculationLogic.swift
//  Calculator
//
//  Created by Амир Кайдаров on 12/30/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number : Double?
    
    private var intermediateCalculation : (number : Double, operation : String)?
    
    mutating func setNumber(_ number : Double) {
        self.number = number
    }
    
    mutating func calculate(_ operation : String) -> Double? {
        if let number = number {
            switch operation {
            case "AC":
                return 0
            case "+/-":
                return number * (-1)
            case "%":
                return number / 100
            case "+":
                intermediateCalculation = (number : number, operation : operation)
            case "=":
                if let ic = intermediateCalculation {
                    return calculate(ic.operation, on: ic.number, with: number)
                }
                
            default:
                fatalError("Invalid value for operation : \(operation)")
            }
        }
        return nil
    }
    
    private func calculate(_ operation : String, on n1 : Double, with n2 : Double) -> Double{
        switch operation{
        case "+":
            return n1 + n2
        case "-":
            return n1 - n2
        case "×":
            return n1 * n2
        case "÷":
            return n1 / n2
        default:
            fatalError("Invalid value for operation : \(operation)")
        }
    }
    
}
