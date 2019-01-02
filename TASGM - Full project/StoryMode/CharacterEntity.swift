//
//  Character.swift
//  StoryMode1
//
//  Created by Stanimir on 12/26/18.
//  Copyright © 2018 StanArts. All rights reserved.
//

import GameplayKit

class CharacterEntity : GKEntity {
    
    var st_machine : GKStateMachine?
    
    var idleAnimation: String = "IdleAnim"
    var jumpAnimation: String = "JumpAnim"
    var apexAnimation: String = "ApexAnim"
    var fallAnimation: String = "FallAnim"
    var walkAnimation: String = "WalkAnim"
    var runAnimation: String = "RunAnim"
    
    var idle: SKAction?
    var jump: SKAction?
    var apex: SKAction?
    var fall: SKAction?
    var walk: SKAction?
    var run: SKAction?
    
    func prepareSprite(){
        
        idle = SKAction(named: idleAnimation)!
        jump = SKAction(named: jumpAnimation)!
        apex = SKAction(named: apexAnimation)!
        fall = SKAction(named: fallAnimation)!
        walk = SKAction(named: walkAnimation)!
        run =  SKAction(named: runAnimation)!
        
        if let node = self.component(ofType: GKSKNodeComponent.self)?.node as! SKSpriteNode? {
            st_machine = GKStateMachine(states: [
                IdleState(withNode: node , animation: idle!),
                WalkingState(withNode: node , animation: walk!),
                JumpingState(withNode: node, animation: jump!),
                JumpApexState(withNode: node, animation: apex!),
                FallingState(withNode: node, animation: fall!),
                RunningState(withNode: node, animation: run!),
                AttackingState(withNode: node, animation: run!)
                ])
            st_machine?.enter(IdleState.self)
        }
        
    }

    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        st_machine?.update(deltaTime: seconds)
    }
}
