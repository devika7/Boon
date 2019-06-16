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

        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
