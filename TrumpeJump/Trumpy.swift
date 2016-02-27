//
//  Trumpy.swift
//  TrumpeJump
//
//  Created by Sam Coffey on 2/27/16.
//  Copyright © 2016 trumpejump. All rights reserved.
//

import Foundation
import SpriteKit

class Trumpy : SKSpriteNode {
    
    let torso = SKSpriteNode(imageNamed: "middle.png")
    let legs = SKSpriteNode(imageNamed: "dt_legs.png")
    let arm_r = SKSpriteNode(imageNamed: "dt_arm_r.png")
    let arm_l = SKSpriteNode(imageNamed: "dt_arm_l.png")
    let head = SKSpriteNode(imageNamed: "dt_head.png")
    
    init() {
        
        let size = CGSizeMake(32,40)
        super.init(texture: nil, color: UIColor.clearColor(), size: size)
        
    }
    
    func loadAppearance() {
        
        
        torso.position = CGPointMake(self.frame.size.width - 10, self.frame.size.height - 10)
        addChild(torso)
        
        legs.position = CGPointMake(torso.position.x, torso.position.y - legs.size.width / 2)
        torso.addChild(legs)
        
        arm_r.position = CGPointMake(torso.position.x + (torso.size.width /2), torso.position.y + (torso.size.height /2))
        arm_r.anchorPoint = CGPointMake(0.9,0.9)
        torso.addChild(arm_r)
        
        arm_l.position = CGPointMake(torso.position.x - (torso.size.width /2), torso.position.y - (torso.size.height /2))
        arm_l.anchorPoint = CGPointMake(0.9,0.9)
        torso.addChild(arm_l)
        
        head.position = CGPointMake(torso.position.x, torso.position.y + torso.size.height/2 + head.size.height/2)
        torso.addChild(head)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func throwObject() {
        
        let rotateBack = SKAction.rotateByAngle(CGFloat(M_PI)/2, duration: 0.15)
        let rotateForward = SKAction.rotateByAngle(-CGFloat(M_PI)/2, duration: 0.15)
        
        arm_l.runAction(rotateBack)
        arm_l.runAction(rotateForward)
        
    }
    
    
    
    
    
    
}
