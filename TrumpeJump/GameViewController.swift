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
    
    @IBAction func playButton(sender: AnyObject) {
        presentViewController(TrumpGameController(), animated: true, completion: nil)
    }
    
    var scene : GameScene!
    var audioPlayer: AVAudioPlayer?
    @IBOutlet weak var musicSwitch: UISwitch!
    
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
        if(!musicSwitch.on){
            audioPlayer?.stop()
        }else{
            audioPlayer?.play()
        }
        let storyboard = UIStoryboard(name: "endGame", bundle: nil)
        let controller = storyboard.instantiateViewControllerWithIdentifier("InitialController") as UIViewController
        
        self.presentViewController(controller, animated: true, completion: nil)

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

