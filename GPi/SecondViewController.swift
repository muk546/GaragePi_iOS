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
    
    let playerViewController = AVPlayerViewController()
    
    @IBOutlet weak var videoView: UIView!

    func play()
    {
        
        //messing around with streaming m3u8 content

        //https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.m3u8
        
        
        let videoUrl = URL(string: "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.m3u8")
        
        let player = AVPlayer(url: videoUrl!)
        
        let playerViewController = AVPlayerViewController()
        
        playerViewController.player = player
        
        playerViewController.showsPlaybackControls = false

        videoView.addSubview(playerViewController.view)

        playerViewController.view.frame = videoView.bounds
        
        playerViewController.player?.play()


      //  self.present(playerViewController, animated: true) {
       //     playerViewController.player!.play()}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        
    }

    @IBAction func BTN_PUSH(_ sender: UIButton) {
        play()

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

