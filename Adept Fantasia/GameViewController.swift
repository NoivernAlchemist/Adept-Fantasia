//
//  GameViewController.swift
//  Adept Fantasia
//
//  Created by Alexander Hall on 9/27/18.
//  Copyright © 2018 Hall Inc. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            //NEED a GameScene.SKS file to run vvv!!!!
            // Load the SKScene from 'GameScene.sks'
            if let scene = GameScene(fileNamed: "GameScene") {
                
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                scene.backgroundColor = SKColor.red
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    @IBAction func playButton(_ sender: Any) {
        self.performSegue(withIdentifier: "SegueToMainView", sender: nil)
    }
    
    @IBAction func goToStatisticsView(_ sender: Any) {
        self.performSegue(withIdentifier: "SegueToStatisticsView", sender: nil)
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
}
