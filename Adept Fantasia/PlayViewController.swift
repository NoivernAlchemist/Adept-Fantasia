//
//  PlayViewController.swift
//  Adept Fantasia
//
//  Created by Alexander Hall on 10/1/18.
//  Copyright © 2018 Hall Inc. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

var audioPlayer = AVAudioPlayer()

class PlayViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Aaron_Smith_Ft_Luvli_Dancin_Krono_Remix_ostofmydays_(mp3co.biz)", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            
            /*let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            }
            catch {
                //something
            } */
        }
        catch {
            print("The audio file was not found!")
        }
       
        audioPlayer.play()
        
        if let view = self.view as! SKView? {
            
            // Load the SKScene from 'PlayScene.sks'
            if let scene = SKScene(fileNamed: "PlayScene") {
                
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
    }
    
    /*func onEndOfGame() {
        self.performSegue(withIdentifier: "SegueFromPlayViewToEndView", sender: nil)
    } */
    
    @IBAction func SegueToEndViewController(_ sender: Any) {
        
        self.performSegue(withIdentifier: "SegueFromPlayViewToEndView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let endVC = segue.destination as! EndViewController
        endVC.someData = "lebronjames"
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

