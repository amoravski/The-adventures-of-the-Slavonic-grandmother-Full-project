//
//  FallingState.swift
//  StoryMode1
//
//  Created by Stanimir on 12/26/18.
//  Copyright © 2018 StanArts. All rights reserved.
//

import GameplayKit
import SpriteKit

class FallingState: GKState {
    var node: SKSpriteNode
    var anim: SKAction
    
    init(withNode: SKSpriteNode, animation: SKAction) {
        node = withNode
        anim = animation
    }

    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is IdleState.Type:
            return true
        case is WalkingState.Type:
            return true
        case is RunningState.Type:
            return true
        default:
            return false
        }
    }

    override func didEnter(from previousState: GKState?) {
        node.run(anim)
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        if ((node.physicsBody?.velocity.dy)! == 0) {
            if ((node.physicsBody?.velocity.dx)! == 0) {
                stateMachine?.enter(IdleState.self)
            } else {
                stateMachine?.enter(WalkingState.self)
            }
        }
    }
    
}
