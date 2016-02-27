//
//  GameScene.swift
//  
//
//  Created by Sam Coffey on 2/27/16.
//
//

import SpriteKit

class GameScene : SKScene {
    
    init() {
        super.init(size: size)
        
        let background = SKSpriteNode(imageNamed: "")
        addChild(background)
        
        
    }

    override func didMoveToView(view: SKView) {
        
        anchorPoint = CGPointMake(x: 0.5, y: 0.5)
        
        
    }
    
    
}
