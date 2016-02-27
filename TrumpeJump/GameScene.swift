//
//  GameScene.swift
//  
//
//  Created by Sam Coffey on 2/27/16.
//
//

import SpriteKit

class GameScene : SKScene {
    
    override init() {
        super.init(/*size: size*/)
        
        let background = SKSpriteNode(imageNamed: "")
        addChild(background)
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not beenplemed")
    }

    override func didMoveToView(view: SKView) {
        
        anchorPoint = CGPointMake(0.5, 0.5)
        
        
    }
    
    
}
