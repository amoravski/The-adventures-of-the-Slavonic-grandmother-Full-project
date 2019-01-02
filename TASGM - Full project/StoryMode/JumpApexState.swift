//
//  JumpApexState.swift
//  StoryMode1
//
//  Created by Stanimir on 12/26/18.
//  Copyright © 2018 StanArts. All rights reserved.
//

import GameplayKit
import SpriteKit

class JumpApexState : GKState {
    var node: SKSpriteNode
    var anim: SKAction
    
    init(withNode: SKSpriteNode, animation: SKAction) {
        node = withNode
        anim = animation
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is FallingState.Type:
            return true
        default:
            return false
        }
    }
    
    
    override func didEnter(from previousState: GKState?) {
        if let _ = previousState as? JumpingState{
            node.run(anim, completion: {
                self.stateMachine?.enter(FallingState.self)
            })
        }  else {
            print("Coming from unknown state.")
        }
    }
    
}
