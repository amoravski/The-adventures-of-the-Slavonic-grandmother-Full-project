//
//  PlayerControlComponent.swift
//  StoryMode1
//
//  Created by Stanimir on 12/26/18.
//  Copyright © 2018 StanArts. All rights reserved.
//

import GameplayKit
import SpriteKit

class PlayerControlComponent: GKComponent,  ControllInputSourceDelegate{
    
    
    var touchControlNode : PlayerTouchControllInput?
    
    func setupControls(camera : SKCameraNode, scene: SKScene) {
        
        touchControlNode = PlayerTouchControllInput(frame: scene.frame)
        touchControlNode?.inputDelegate = self
        touchControlNode?.position = CGPoint.zero
        
        camera.addChild(touchControlNode!)
    }
    
    func follow(command: String?) {
        if let moveComponent = entity?.component(ofType: ActionComponent.self){
            switch (command!){
            case ("left"):
                moveComponent.moveLeft()
            case ("right"):
                moveComponent.moveRight()
            case ("A"):
                moveComponent.jump()
            case ("down"):
                moveComponent.getDown()
            case ("stop down"):
                moveComponent.stopDown()
            case ("X"):
                moveComponent.beginRun()
            case "stop X","cancel X":
                moveComponent.stopRun()
            case "stop right","stop left","cancel right","cancel left":
                moveComponent.stopMoving()
            case ("B"):
                moveComponent.attack()
            default:
                print("other button \(String(describing: command))")
            }
        }
    }
    
}
