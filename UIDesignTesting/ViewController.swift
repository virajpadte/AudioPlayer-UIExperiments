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
    @IBOutlet weak var albumName: UILabel!
    
    @IBOutlet weak var playPauseButton: UIButton!
    
    //timer object
    
    var timer = Timer()
    
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    
        //create a duplicate frame
        
        let newLabelFrame = CGRect(x: self.albumName.frame.minX, y: self.albumName.frame.minY, width: self.albumName.frame.width, height: self.albumName.frame.height)
        let newLabel = UILabel(frame: newLabelFrame)
        newLabel.text = self.albumName.text
        newLabel.center = CGPoint(x: self.view.bounds.width + self.albumName.center.x, y: self.albumName.center.y)
        newLabel.lineBreakMode = NSLineBreakMode.byClipping
        newLabel.textColor = albumName.textColor
        newLabel.alpha = 0.55
        
        self.view.addSubview(newLabel)
        let orgCenterX = self.albumName.center.x
        UIView.animate(withDuration: 15, delay: 3, options: .repeat, animations: {
            self.albumName.center.x = 0 - self.albumName.center.x
            newLabel.center.x = orgCenterX
        }, completion: nil)
        
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
                
                //after 7 seconds of playing the song start scrolling the text
                
                //scroll text
                
                
                
                //timer = Timer(timeInterval: 5, target: self, selector: #selector(scrollText) , userInfo: nil, repeats: false)
                
                
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
    
    func scrollText(){
        
        
        
        //wait for 2 secs and again scroll
        
        
    }
    
}

