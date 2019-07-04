//
//  PlayPodcastViewController.swift
//  BoonDemo1
//
//  Created by Shreya Navelkar on 5/31/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class PlayPodcastViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
