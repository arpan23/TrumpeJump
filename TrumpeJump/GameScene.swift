//
//  GameScene.swift
//  
//
//  Created by Sam Coffey on 2/27/16.
//
//

import SpriteKit

class GameScene : SKScene {
    
    var skView : SKView!
    
    override init(size: CGSize) {
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        
//        backgroundColor = UIColor(colorLiteralRed: 73, green: 181, blue: 229)
        backgroundColor = UIColor(red: 73/255, green: 181/255, blue: 229/255, alpha: 1.0)

    }

}
