//
//  PlayVideoViewController.swift
//  BoonDemo1
//
//  Created by Shreya Navelkar on 4/21/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import Firebase

class PlayVideoViewController: UIViewController {
    var urlArray : [String] = []
    var selectedVideoUrl : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadVideo(firebaseUrl: selectedVideoUrl)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadVideo(firebaseUrl : String){
        let videoUrl = NSURL(string: firebaseUrl)
        let player = AVPlayer(url: videoUrl! as URL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true){
            playerViewController.player?.play()
        }
    }
}
