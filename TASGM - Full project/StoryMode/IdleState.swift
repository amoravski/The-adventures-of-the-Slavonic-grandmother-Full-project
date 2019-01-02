//
//  IdleState.swift
//  StoryMode1
//
//  Created by Stanimir on 12/26/18.
//  Copyright © 2018 StanArts. All rights reserved.
//

import SpriteKit
import GameplayKit

class IdleState: GKState {
    
    var node: SKNode
    var anim: SKAction
    
    init(withNode: SKNode, animation: SKAction) {
        node = withNode
        anim = animation
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is WalkingState.Type:
            return true
        case is FallingState.Type:
            return true
        case is JumpingState.Type:
            return true
        case is RunningState.Type:
            return true
        case is AttackingState.Type:
            return true
        default:
            return false
        }
    }
    
    
    override func didEnter(from previousState: GKState?) {
        if let _ = previousState as? WalkingState{
            print("stopping animation would play here")
        } else if let _ = previousState as? FallingState{
            print("landingState would play here")
        } else if let _ = previousState as? RunningState{
            print("breaking animation would play here")
        }
        node.run(anim, withKey: "idle")
        
    }
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        if ((node.physicsBody?.velocity.dy)! < -0.1){
            stateMachine?.enter(FallingState.self)
        }
    }
    
}
