//
//  ViewController.swift
//  Play Xylophone
//
//  Created by Jo Thorpe on 26/06/2018.
//  Copyright © 2018 Oxfam Reject. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    let soundArray = ["note1","note2","note3","note4","note5","note6","note7"]
    var selectedSoundFileName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func notePressed(_ sender: UIButton) {
        
        selectedSoundFileName = soundArray[sender.tag - 1 ]
        playSound()
        
    }
    
    
    func playSound() {
        
        if let soundURL = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            //Play
            AudioServicesPlaySystemSound(mySound)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

