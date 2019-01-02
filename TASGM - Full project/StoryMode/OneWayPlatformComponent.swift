//
//  OneWayPlatformComponent.swift
//  StoryMode1
//
//  Created by Stanimir on 12/26/18.
//  Copyright © 2018 StanArts. All rights reserved.
//

import GameplayKit
import SpriteKit

class OneWayPlatformComponent : GKComponent {
    
    var playerNode:PlayerNode?
    var node:SKNode?
    var contactWithPlayerNode = false
    
    func setUpWithPlayer(playerNode: PlayerNode?){
        self.playerNode = playerNode
        if let nodeComponent = self.entity?.component(ofType: GKSKNodeComponent.self){
            node = nodeComponent.node
        }
        node?.physicsBody?.categoryBitMask = ColliderType.PLATFORM
        node?.physicsBody?.contactTestBitMask = ColliderType.PLATFORM
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        if ((playerNode?.position.y)! - 46) > (node?.position.y)! && !(playerNode?.pressingDown)! {
                node?.physicsBody?.categoryBitMask = ColliderType.PLATFORM
        }else {
            node?.physicsBody?.categoryBitMask = 0
        }
        
    }
    
//    func getDown(){
//        if (contactWithPlayerNode){
//            node?.physicsBody?.categoryBitMask = 0
//            contactWithPlayerNode = false
//        }
//    }
    
}
