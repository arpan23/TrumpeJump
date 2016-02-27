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
    
    var scene : GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView 
        
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
