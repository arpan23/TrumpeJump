//
//  GameScene.swift
//  
//
//  Created by Sam Coffey on 2/27/16.
//
//

import SpriteKit

class GameScene : SKScene, SKPhysicsContactDelegate {
    
    var trumpy : Trumpy!

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToView(view: SKView) {
        
        trumpy = Trumpy()
        trumpy.position = CGPointMake(self.view!.frame.size.width, self.view!.frame.size.height)
        addChild(trumpy)
        
    }
    
    
}
