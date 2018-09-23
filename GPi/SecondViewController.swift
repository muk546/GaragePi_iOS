//
//  SecondViewController.swift
//  GPi
//
//  Created by Mukul on 7/26/18.
//  Copyright © 2018 Mukul. All rights reserved.
//

import UIKit
import CocoaMQTT
import AVKit
import AVFoundation
import MediaPlayer
import AudioToolbox


class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var VideoHero: UIView!
    var player : AVPlayer?



    
    
    //fullscreen method
    func handlePlay() {
        
        //user input url:
        let testingIP = defaults.string(forKey: "IP")
        let testingPORT = defaults.string(forKey: "PORT")
        let testingPORTCAM = defaults.string(forKey: "PORT_CAM")
        
        print("User Saved IP: " + testingIP!)
        print("User Saved PORT: " + testingPORT!)
        print("User Saved PORT CAM: " + testingPORTCAM!)

        
        //let videoURL = URL(string: "http://192.168.1.9:8080/camera/livestream.m3u8")
        var string_cam_url = "http://" + testingIP! + ":" + testingPORTCAM! + "/camera/livestream.m3u8"

        let videoURL = URL(string: string_cam_url)

        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      //  handlePlay()
        
    
        


    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        //hardcoded url
        // let url : URL = URL(string: "http://192.168.1.9:8080/camera/livestream.m3u8")!
        
        //user input url:
        let testingIP = defaults.string(forKey: "IP")
        let testingPORT = defaults.string(forKey: "PORT")
        let testingPORTCAM = defaults.string(forKey: "PORT_CAM")
        
        print("User Saved IP: " + testingIP!)
        print("User Saved PORT: " + testingPORT!)
        print("User Saved PORT CAM: " + testingPORTCAM!)
        
        var string_cam_url = "http://" + testingIP! + ":" + testingPORTCAM! + "/camera/livestream.m3u8"
        
        print(string_cam_url)
        
        let url : URL = URL(string: string_cam_url)!
        
        
        player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.VideoHero.bounds
        self.VideoHero.layer.addSublayer(playerLayer)
        
    }
    
    
    @IBAction func BTN_PUSH(_ sender: UIButton) {
        handlePlay()
        //player?.play()
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

