//
//  ViewController.swift
//  AvSpeechSynthesizer
//
//  Created by MAC on 19.07.2019.
//  Copyright © 2019 cagdaseksi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let utterance = AVSpeechUtterance(string: "Hello swift.")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.1
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
        
    }

    

}

