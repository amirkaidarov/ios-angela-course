//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

enum Hardness : String {
    case soft = "Soft"
    case medium = "Medium"
    case hard = "Hard"
}

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes  = [Hardness.soft: 3, Hardness.medium: 4, Hardness.hard: 7]
    
    var secondsPassed : Float = 0
    var totalTime : Float = 0
    
    var timer = Timer()
    var player: AVAudioPlayer!
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = Hardness(rawValue: sender.currentTitle!)!
        totalTime = Float(eggTimes[hardness]!)
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness.rawValue
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTime() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentage = secondsPassed / totalTime
            progressBar.progress = percentage
        } else {
            titleLabel.text = "Done"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
            timer.invalidate()
        }
    }
    
}
