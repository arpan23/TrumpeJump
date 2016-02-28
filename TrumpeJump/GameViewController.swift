//
//  ViewController.swift
//  TrumpeJump
//
//  Created by Robin Onsay on 2/27/16.
//  Copyright © 2016 trumpejump. All rights reserved.
//

import UIKit
import SpriteKit
import AVKit
import AVFoundation
class GameViewController: UIViewController {
    
    var scene : GameScene!
    var audioPlayer: AVAudioPlayer?
    @IBOutlet weak var musicSwitch: UIButton!
    var musicOff = false;
    
    @IBOutlet weak var musicButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let path = NSBundle.mainBundle().pathForResource("song", ofType: "mp3") {
            do{
            try audioPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path), fileTypeHint: "mp3")
            }catch{
                
            }
            if let sound = audioPlayer {
                
                sound.prepareToPlay()
                
                sound.play()
            }
        }
        
        
    }

    @IBAction func turnMusicOff(sender: AnyObject) {
        
        var image: UIImage?;
        
        if (!musicOff){ // music is on
            audioPlayer!.stop()
            image = UIImage(named: "music-2")
            
        }
        else{
            image = UIImage(named: "music")
            
            audioPlayer!.play()
            
        }
        sender.setImage(image, forState: .Normal)
        
        musicOff = !musicOff;
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func shouldAutoRotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Landscape
    }


}

