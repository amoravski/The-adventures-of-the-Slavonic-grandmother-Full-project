//
//  AttackComponent.swift
//  StoryMode1
//
//  Created by Stanimir on 12/26/18.
//  Copyright © 2018 StanArts. All rights reserved.
//

import GameplayKit

class AttackComponent : GKComponent {

    //
    //    var alphaUnpressed:CGFloat = 0.5
    //    var alphaPressed:CGFloat   = 0.9
    //
    //    var camera:SKCameraNode?
    //    var scene :SKScene?
    //    var pressedButtons = [SKSpriteNode]()
    //
    //    let buttonDirUp     = ControllerButton(imageNamed: "button_dir_up_0")
    //    let buttonDirLeft   = ControllerButton(imageNamed: "button_dir_left_0")
    //    let buttonDirDown   = ControllerButton(imageNamed: "button_dir_down_0")
    //    let buttonDirRight  = ControllerButton(imageNamed: "button_dir_right_0")
    //
    //    let buttonA = ControllerButton(texture: SKTexture(image: #imageLiteral(resourceName: "button_a")))
    //    let buttonB = ControllerButton(texture: SKTexture(image: #imageLiteral(resourceName: "button_b")))
    //    let buttonX = ControllerButton(texture: SKTexture(image: #imageLiteral(resourceName: "button_x")))
    //    let buttonY = ControllerButton(texture: SKTexture(image: #imageLiteral(resourceName: "button_y")))
    //
    //
    //    let buttonMenu = SKSpriteNode()
    //
    //    func setupControls(camera : SKCameraNode, scene: SKScene) {
    //
    //        self.camera = camera
    //        self.scene = scene
    //
    //
    //        addButton(button: buttonDirUp,
    //                  position: CGPoint(x: -(scene.size.width / 3 ),y: -scene.size.height / 4 + 50),
    //                  name: "up",
    //                  scale: 2.0)
    //        addButton(button: buttonDirLeft,
    //                  position: CGPoint(x: -(scene.size.width / 3 ) - 50, y: -scene.size.height / 4),
    //                  name: "left",
    //                  scale: 2.0)
    //        addButton(button: buttonDirDown,
    //                  position: CGPoint(x: -(scene.size.width / 3 ), y: -scene.size.height / 4 - 50),
    //                  name: "down",
    //                  scale: 2.0)
    //        addButton(button: buttonDirRight,
    //                  position: CGPoint(x: -(scene.size.width / 3 ) + 50, y: -scene.size.height / 4),
    //                  name: "right",
    //                  scale: 2.0)
    //        addButton(button: buttonX,
    //                  position: CGPoint(x: (scene.size.width / 3 ), y: -scene.size.height / 4 + 50),
    //                  name: "X",
    //                  scale: 0.40)
    //        addButton(button: buttonY,
    //                  position: CGPoint(x: (scene.size.width / 3 ) - 50, y: -scene.size.height / 4),
    //                  name: "Y",
    //                  scale: 0.40)
    //        addButton(button: buttonB,
    //                  position: CGPoint(x: (scene.size.width / 3 ), y: -scene.size.height / 4 - 50),
    //                  name: "B",
    //                  scale: 0.40)
    //        addButton(button: buttonA,
    //                  position: CGPoint(x: (scene.size.width / 3 ) + 50, y: -scene.size.height / 4),
    //                  name: "A",
    //                  scale: 0.40)
    //    }
    //
    //    func addButton(button: ControllerButton, position: CGPoint, name: String, scale: CGFloat){
    //        button.position = position
    //        button.setScale(scale)
    //        button.setName(name: name)
    //        button.name = name
    //        button.zPosition = 10
    //        button.alpha = alphaUnpressed
    //        button.pcComponent = self
    //        button.isUserInteractionEnabled = true
    //        camera?.addChild(button)
    //    }
    
    
    //    func touchDown(atPoint pos : CGPoint) {
    //        let location = pos
    //        // for all 4 buttons
    //        for button in [buttonDirUp, buttonDirLeft, buttonDirDown, buttonDirRight, buttonA, buttonB, buttonX, buttonY] {
    //            // I check if they are already registered in the list
    //            if button.contains(location) && pressedButtons.index(of: button) == nil {
    //                pressedButtons.append(button)
    //                follow(input: button.name!)
    //
    //            }
    //            if pressedButtons.index(of: button) == nil {
    //                button.alpha = alphaUnpressed
    //            }
    //            else {
    //                button.alpha = alphaPressed
    //            }
    //        }
    //    }
    //
    //
    //    func touchMoved(toPoint pos : CGPoint, previous : CGPoint) {
    //        let location = pos
    //        let previousLocation = previous
    //        for button in [buttonDirUp, buttonDirLeft, buttonDirDown, buttonDirRight, buttonA, buttonB, buttonX, buttonY] {
    //            // if I get off the button where my finger was before
    //            if button.contains(previousLocation)
    //                && !button.contains(location) {
    //                // I remove it from the list
    //                let index = pressedButtons.index(of: button)
    //                if index != nil {
    //                    pressedButtons.remove(at: index!)
    //                    follow(input: "cancel \(String(describing: button.name!))")
    //                }
    //            }
    //                // if I get on the button where I wasn't previously
    //            else if !button.contains(previousLocation)
    //                && button.contains(location)
    //                && pressedButtons.index(of: button) == nil {
    //                // I add it to the list
    //                pressedButtons.append(button)
    //                follow(input: button.name!)
    //            }
    //            if pressedButtons.index(of: button) == nil {
    //                button.alpha = alphaUnpressed
    //            }
    //            else {
    //                button.alpha = alphaPressed
    //            }
    //        }
    //    }
    //
    //    func touchUp(touches: Set<UITouch>?, withEvent event: UIEvent?) {
    //        for touch in touches! {
    //            let location = touch.location(in: camera!)
    //            let previousLocation = touch.previousLocation(in: camera!)
    //            for button in [buttonDirUp, buttonDirLeft, buttonDirDown, buttonDirRight, buttonA, buttonB, buttonX, buttonY] {
    //                if button.contains(location) {
    //                    let index = pressedButtons.index(of: button)
    //                    if index != nil {
    //                        pressedButtons.remove(at: index!)
    //                        follow(input: "stop \(String(describing: button.name!))")
    //                    }
    //                }
    //                else if (button.contains(previousLocation)) {
    //                    let index = pressedButtons.index(of: button)
    //                    if index != nil {
    //                        pressedButtons.remove(at: index!)
    //                        follow(input: "stop \(String(describing: button.name!))")
    //                    }
    //                }
    //                if pressedButtons.index(of: button) == nil {
    //                    button.alpha = alphaUnpressed
    //                }
    //                else {
    //                    button.alpha = alphaPressed
    //                }
    //            }
    //        }
    //
    //    }
    func attack(){
        print("attack")
        if let stateMachine = (self.entity as! CharacterEntity?)?.st_machine {
            print("tried to enter state")
            if (stateMachine.canEnterState(AttackingState.self)) {
                print("entered state")
                stateMachine.enter(AttackingState.self)
            }
        }
    }

}
