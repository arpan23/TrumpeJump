//
//  TrumpGameController.swift
//  TrumpeJump
//
//  Created by Sam Coffey on 2/27/16.
//  Copyright © 2016 trumpejump. All rights reserved.
//

import Foundation
import SpriteKit

class TrumpGameController: UIViewController {
    
    var trumpy : Trumpy!
    
    override func loadView() {
        self.view = SKView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trumpy = Trumpy()
        trumpy.position = CGPointMake(view.frame.width/2, view.frame.height/2)
        
        let skView = self.view as! SKView
        
        let scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        skView.presentScene(scene)
    
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
