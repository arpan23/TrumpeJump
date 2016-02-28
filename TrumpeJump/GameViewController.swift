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
    @IBOutlet weak var musicSwitch: UIButton!
    var musicOff = false;
    var longTouch = false;
    
    @IBOutlet weak var musicButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//let path = NSBundle.mainBundle().pathForResource("song", ofType: "mp3")
        if let path = NSBundle.mainBundle().pathForResource("Freedom.Theme", ofType: "wav") {
            do{
            try audioPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path), fileTypeHint: "wav")
            }catch{
                
            }
            if let sound = audioPlayer {
                
                sound.prepareToPlay()
                
                sound.play()
            }
        }
    }
    
    
    @IBAction func switchTouchType(sender: AnyObject) {
        
        var image: UIImage?;
        
        
        if (!longTouch){ // 3D Touch is on
            image = UIImage(named: "longTouch")
        }
        else{
            image = UIImage(named: "3dtouch")
        }
        
        sender.setImage(image, forState: .Normal)
        
        longTouch = !longTouch;
    }

//    @IBAction func switchThing(sender: AnyObject) {
//        audioPlayer?.stop()
//        let storyboard = UIStoryboard(name: "endGame", bundle: nil)
//        let controller = storyboard.instantiateViewControllerWithIdentifier("InitialController") as UIViewController
//        
//        self.presentViewController(controller, animated: true, completion: nil)
//    }
    @IBAction func turnMusicOff(sender: AnyObject) {
        
        var image: UIImage?;
        
        if (!musicOff){ // music is on
            audioPlayer!.stop()
            image = UIImage(named: "music-off")
            
        }
        else{
            image = UIImage(named: "music-on")
            
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

