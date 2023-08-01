//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumber : Bool = true
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var calculationLogic = CalculatorLogic()
    
    private var displayValue : Double {
        get {
            guard let result = Double(displayLabel.text!) else {
                fatalError("Cannot convert a string \(String(describing: displayLabel.text)) into a Double")
            }
            return result
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        if let operation = sender.currentTitle {
            calculationLogic.setNumber(displayValue)
            if let result = calculationLogic.calculate(operation) {
                displayValue = result
            }
            //            switch operation {
            //            case "AC":
            //                displayLabel.text = "0"
            //            case "+/-":
            //                displayValue *= (-1)
            //            case "%":
            //                displayValue /= 100
            //            default:
            //                fatalError("Invalid value for operation : \(operation)")
            //            }
            
        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numString = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numString
                isFinishedTypingNumber = false
            } else {
                
                if numString == "." {
                    
                    let isInt : Bool = floor(displayValue) == displayValue
                    
                    if !isInt{
                        return
                    }
                    
                }
                
                displayLabel.text! += numString
            }
        }
        
    }
    
}

