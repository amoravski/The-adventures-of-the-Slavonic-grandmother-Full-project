//
//  GameScene.swift
//  StoryMode1
//
//  Created by Stanimir on 12/26/18.
//  Copyright © 2018 StanArts. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var gameViewController : GameViewController?
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    var parallaxComponentSystem: GKComponentSystem<ParallaxComponent>?
    var oneWayPlatformComponentSystem: GKComponentSystem<OneWayPlatformComponent>?
    
    var before = false
    
    private var lastUpdateTime : TimeInterval = 0
 
    var thePlayer: PlayerNode?

    //MARK: Scene Starts
    
    override func sceneDidLoad() {

        self.lastUpdateTime = 0
    }

    func reachCheckPoint(){
        gameViewController?.saveCheckpoint(position: (thePlayer?.position)!)
    }
    
    func returnToCheckpoint(){
        thePlayer?.position = (gameViewController?.playerPosition)!
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        before = true
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        parallaxComponentSystem?.update(deltaTime: currentTime)
        oneWayPlatformComponentSystem?.update (deltaTime: currentTime)
        
        self.lastUpdateTime = currentTime
        
    }
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self

        self.physicsWorld.gravity = CGVector(dx: 0.0,dy: -5)
        
        parallaxComponentSystem = GKComponentSystem.init(componentClass: ParallaxComponent.self)
        oneWayPlatformComponentSystem = GKComponentSystem.init(componentClass: OneWayPlatformComponent.self)
        
        for entity in self.entities{
            parallaxComponentSystem?.addComponent (foundIn: entity)
            oneWayPlatformComponentSystem?.addComponent (foundIn: entity)
        }
        
        if ((self.childNode(withName: "Player") as? PlayerNode!) != nil){
            thePlayer = (self.childNode(withName: "Player") as? PlayerNode)!
            let ent = self.entities.index(of: (thePlayer?.entity)!)
            self.entities.remove(at: ent!)
            thePlayer?.setupPlayer()
            self.entities.append((thePlayer?.entity)!)
            if let pcc = thePlayer?.entity?.component(ofType: PlayerControlComponent.self){
                pcc.setupControls(camera: camera!, scene: self)
            }
        }
        
        for component in (parallaxComponentSystem?.components)!{
            component.prepareWith(camera: camera)
        }
        for component in (oneWayPlatformComponentSystem?.components)!{
            component.setUpWithPlayer(playerNode: thePlayer)
        }
    }
//    //MARK =========== Override Touch
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches {
//
//            if let playerControl = thePlayer?.entity?.component(ofType: PlayerControlComponent.self){
//                playerControl.touchDown(atPoint: t.location(in: self.camera!))
//            }
//        }
//
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches {
//
//            if let playerControl = thePlayer?.entity?.component(ofType: PlayerControlComponent.self){
//                playerControl.touchMoved(toPoint: t.location(in: self.camera!), previous: t.previousLocation(in: self.camera!))
//            }
//        }
//
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        if let playerControl = thePlayer?.entity?.component(ofType: PlayerControlComponent.self){
//            playerControl.touchUp(touches: touches, withEvent: event)
//        }
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        if let playerControl = thePlayer?.entity?.component(ofType: PlayerControlComponent.self){
//            playerControl.touchUp(touches: touches, withEvent: event)
//        }
//
//    }


    //MARK: ============= Physics
    
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask == ColliderType.PLAYER || contact.bodyB.categoryBitMask == ColliderType.PLAYER){
            if let moveComponent = thePlayer?.entity?.component(ofType: ActionComponent.self){
                moveComponent.onGround = true
            }
        }
        
        if (contact.bodyA.contactTestBitMask == ColliderType.GROUND && contact.bodyB.contactTestBitMask == ColliderType.PLATFORM){
            if let platComponent = contact.bodyB.node?.entity?.component(ofType: OneWayPlatformComponent.self) {
                platComponent.contactWithPlayerNode = true
            }
        }
        if (contact.bodyB.contactTestBitMask == ColliderType.GROUND && contact.bodyA.contactTestBitMask == ColliderType.PLATFORM){
            if let platComponent = contact.bodyA.node?.entity?.component(ofType: OneWayPlatformComponent.self) {
                platComponent.contactWithPlayerNode = true
            }
        }
    }

    //MARK: Camera
    
    func centerOnNode(node: SKNode) {
        //let cameraPositionInScene: CGPoint = node.scene!.convert(node.position, from: node.parent!)
        self.camera!.run(SKAction.move(to: CGPoint(x:node.position.x , y:node.position.y), duration: 0.5))
    }
    
    override func didFinishUpdate() {
        //self.camera?.position = CGPoint(x: (thePlayer?.position.x)!, y: (thePlayer?.position.y)!)
        centerOnNode(node: thePlayer!)
    }
    
}
