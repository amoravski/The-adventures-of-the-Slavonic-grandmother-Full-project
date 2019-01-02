//
//  MainMenuScene.swift
//  StoryMode1
//
//  Created by Stanimir on 12/26/18.
//  Copyright © 2018 StanArts. All rights reserved.
//

import SpriteKit

class MainMenuScene : SKScene {
    var gameViewController : GameViewController?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (gameViewController != nil){
            gameViewController?.startGame()
        }
    }
    
}
