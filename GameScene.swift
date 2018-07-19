//
//  GameScene.swift
//  SpriteKitDemo
//
//  Created by JoesMac on 7/17/18.
//  Copyright © 2018 JoesMac. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let myFirstNode = SKNode()
    let myFirstSpriteNode = SKSpriteNode(color: UIColor.red, size: CGSize(width: 200.0, height: 200.0))
    let blueSprite = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 100.0, height: 100.0))
    let myFirstTexturedSpriteNode = SKSpriteNode(imageNamed: "Spaceship")
    
    override func didMove(to view: SKView) {
        addChild(myFirstNode)
        
        //sprite nodes has anchor point properties set to 0.5 x 0.5
        myFirstSpriteNode.position = CGPoint(x: frame.midX, y: frame.midY)
        myFirstSpriteNode.anchorPoint = CGPoint(x: 0, y: 0) // or CGPoint.zero
        addChild(myFirstSpriteNode)
        
        myFirstTexturedSpriteNode.zPosition = 1
        
        myFirstTexturedSpriteNode.size = CGSize(width: 100.0, height: 100.0)
        //parent node coordinate system originates at the center of the screen
        myFirstSpriteNode.addChild(myFirstTexturedSpriteNode)
        
        blueSprite.zPosition = 2
        blueSprite.position = CGPoint(x: myFirstSpriteNode.size.width/2, y: myFirstSpriteNode.size.height / 2)
        myFirstSpriteNode.addChild(blueSprite)
        
        physicsWorld.gravity = CGVector(dx: -1.0, dy: -2.0)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        myFirstTexturedSpriteNode.physicsBody = SKPhysicsBody(circleOfRadius: myFirstTexturedSpriteNode.size.width / 2)
        myFirstTexturedSpriteNode.physicsBody!.allowsRotation = false
        //full energy bounce back
        myFirstTexturedSpriteNode.physicsBody!.restitution = 1.0
        
        blueSprite.physicsBody = SKPhysicsBody(rectangleOf: blueSprite.size)
        blueSprite.physicsBody!.restitution = 1.0
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*
        //myFirstTexturedSpriteNode.run(SKAction.move(to: CGPoint(x: myFirstSpriteNode.size.width, y: myFirstSpriteNode.size.height), duration: 2.0))
        //blueSprite.run(SKAction.rotate(byAngle: CGFloat(M_PI), duration: 2.0))
        myFirstTexturedSpriteNode.run(SKAction.move(to: CGPoint(x: myFirstSpriteNode.size.width, y: myFirstSpriteNode.size.height), duration: 2.0)) {
            //reset position
            self.myFirstTexturedSpriteNode.position = CGPoint.zero
        }
        if !blueSprite.hasActions(){
        //blueSprite.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(M_PI), duration: 2.0)))
            // at the same time
        //blueSprite.run(SKAction.group([SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 2.0), SKAction.scale(by: 0.9, duration: 2.0)]))
            // one action then the other
            blueSprite.run(SKAction.sequence([SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 2.0), SKAction.scale(by: 0.9, duration: 2.0)]))
        } else {
            blueSprite.removeAllActions()
        }
         */
        if let _ = myFirstTexturedSpriteNode.action(forKey: "Rotation") {
            myFirstTexturedSpriteNode.removeAction(forKey: "Rotation")
        } else {
            myFirstTexturedSpriteNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 2.0)), withKey: "Rotation")
        }
    }
 
    
}
