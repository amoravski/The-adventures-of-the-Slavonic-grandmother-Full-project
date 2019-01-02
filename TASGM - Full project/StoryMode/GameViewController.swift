//
//  GameViewController.swift
//  StoryMode1
//
//  Created by Stanimir on 12/26/18.
//  Copyright © 2018 StanArts. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

struct ColliderType {
    static let PLAYER:  UInt32 = 1;
    static let GROUND:  UInt32 = 2;
    static let ENEMY:   UInt32 = 4;
    static let PLATFORM:UInt32 = 8;
    static let PLAYERATTACK: UInt32 = 16;
}

class GameViewController: UIViewController {
    
    var scene = ""
    var playerX = 0.0
    var playerY = 0.0
    
    var playerPosition : CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentMainMenu()
        
    }
    
    func presentMainMenu(){
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "MainMenuScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                if let sceneNode = scene as? MainMenuScene{
                    sceneNode.gameViewController = self
                }
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    func startGame(){
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        if let scene = GKScene(fileNamed: "GameScene") {
            
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! GameScene? {
                
                // Copy gameplay related content over to the scene
                sceneNode.entities = scene.entities
                sceneNode.graphs = scene.graphs
                sceneNode.gameViewController = self
                sceneNode.size = self.view.bounds.size
                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .aspectFill
                
                
                // Present the scene
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode, transition: SKTransition.fade(withDuration: 0.5))
                    
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true
                    view.showsPhysics = true
                }
            }
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func saveCheckpoint(position: CGPoint?){
        playerPosition = position
    }
    
}

