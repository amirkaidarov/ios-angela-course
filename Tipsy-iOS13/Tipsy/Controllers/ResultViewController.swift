//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Амир Кайдаров on 12/18/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var totalPerPerson : Float?
    var numberOfPeople : Int?
    var tip : Int?

    @IBOutlet weak var totalPerPersonLabel: UILabel!
    
    @IBOutlet weak var detailsLabel: UILabel!
    
    
    override func viewDidLoad() {
        totalPerPersonLabel.text = String(format: "%.2f", totalPerPerson!)
        detailsLabel.text = "Split between \(numberOfPeople!), with \(tip!)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
