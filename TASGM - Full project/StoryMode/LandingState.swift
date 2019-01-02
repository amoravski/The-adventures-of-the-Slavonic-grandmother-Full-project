//
//  LandingState.swift
//  StoryMode1
//
//  Created by Stanimir on 12/26/18.
//  Copyright © 2018 StanArts. All rights reserved.
//

import GameplayKit

class LandingState : GKState {
    var node: PlayerNode
    var anim: SKAction
    
    init(withNode: PlayerNode, animation: SKAction) {
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
        print("another happy landing")
        self.stateMachine?.enter(IdleState.self)
    }
}
