//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var zeroTip: UIButton!
    @IBOutlet weak var tenTip: UIButton!
    @IBOutlet weak var twentyTip: UIButton!
    
    @IBOutlet weak var splitNumber: UILabel!
    
    @IBOutlet weak var bill: UITextField!
    
    var tipBrain = TipBrain()
    
    @IBAction func tipSelectPressed(_ sender: UIButton) {
        let userChoice = sender.currentTitle
        
        zeroTip.isSelected = false
        tenTip.isSelected = false
        twentyTip.isSelected = false
        sender.isSelected = true
        
        switch userChoice {
        case "0%":
            tipBrain.tip = 0
        case "10%":
            tipBrain.tip = 10
        case "20%":
            tipBrain.tip = 20
        default:
            return
        }
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        splitNumber.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        tipBrain.setTotalPerPerson(total: bill?.text, numberOfPeople : splitNumber.text)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destination = segue.destination as! ResultViewController
            destination.totalPerPerson = tipBrain.totalPerPerson
            destination.numberOfPeople = Int(splitNumber.text!)
            destination.tip = tipBrain.getTip()
        }
    }
}

