//
//  ViewController.swift
//  UIDesignTesting
//
//  Created by Viraj Padte on 2/4/17.
//  Copyright © 2017 Bit2Labz. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var volume: UISlider!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var titleBar: UINavigationItem!
    
    @IBOutlet weak var playPauseButton: UIButton!
    
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
 
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func playPause(_ sender: Any) {
        
        //check the button tag...
        if playPauseButton.tag == 0 {
            print("played")
            //after play change the button tag
            //get file path
            let path = Bundle.main.path(forResource: "Kasabian - Underdog", ofType: ".mp3")
            let location = URL(fileURLWithPath: path!)
            do {
                try player = AVAudioPlayer(contentsOf: location)
                print("no error")
                player.play()
                
                //if played change the button image and change the tag
                playPauseButton.setImage(UIImage(named: "pause.png"), for: [])
                playPauseButton.tag = 1
                
            } catch  {
                print("some error")
            }

        
        }
        else{
            print("paused")
            //for pause
            player.pause()
            //after pause change the button image and also the tag
            playPauseButton.setImage(UIImage(named: "play.png"), for: [])
            playPauseButton.tag = 0
            
        
        }
    }

    @IBAction func volumeSlider(_ sender: Any) {
        
        player.setVolume(volume.value, fadeDuration: 0.2)
    }
    
}

