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

class PlayVideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let path = Bundle.main.path(forResource: "Video", ofType: "MOV") else {return}
        let videoUrl = URL(fileURLWithPath: path)
        let player = AVPlayer(url: videoUrl)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true){
            playerViewController.player?.play()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var playVideo: UIImageView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

}
