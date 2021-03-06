//
//  EndViewController.swift
//  Adept Fantasia
//
//  Created by Alexander Hall on 10/1/18.
//  Copyright © 2018 Hall Inc. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class EndViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            
            // Load the SKScene from 'EndScene.sks'
            if let scene = SKScene(fileNamed: "EndScene") {
                
                scene.backgroundColor = SKColor.green
                
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
        }
    }
    @IBAction func PlayAgainButton(_ sender: Any) {
        self.performSegue(withIdentifier: "SegueFromEndViewtoPlayView", sender: nil)
       // self.navigationController?.popViewController(animated: true)
       // self.dismiss(animated: true, completion: nil)
        audioPlayer.stop()
        audioPlayer.currentTime = 0;
        audioPlayer.play()
    }
    
    @IBAction func goToHomeView(_ sender: Any) {
        self.performSegue(withIdentifier: "goToHomeViewFromEndView", sender: nil)
        //self.dismiss(animated: true, completion: nil)
    }
    
    /*@IBAction func unwindToHomeView(unwindSegue: UIStoryboardSegue) {
        
    } */
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


