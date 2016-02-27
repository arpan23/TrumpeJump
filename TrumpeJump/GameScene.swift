//
//  GameScene.swift
//  
//
//  Created by Sam Coffey on 2/27/16.
//
//

import SpriteKit

class GameScene : SKScene {
    
    var trumpy : Trumpy!
    
    override func didMoveToView(view: SKView) {
        backgroundColor = UIColor.blueColor()
        
        trumpy = Trumpy()
        trumpy.position = CGPointMake(view.frame.width/2, view.frame.height/2)
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not beenplemed")
    }
   
}
