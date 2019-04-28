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
    
    @IBOutlet weak var playVideo: UIImageView!
    var urlArray : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        urlArray = createVideoUrls()
        guard let path = Bundle.main.path(forResource: "Video", ofType: "MOV") else {return}
        loadVideo(path: path)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadVideo(path : String){
        let videoUrl = URL(fileURLWithPath: path)
        let player = AVPlayer(url: videoUrl)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true){
            playerViewController.player?.play()
        }
    }
    
    func createVideoUrls() -> [String]{
        var tempVideoUrls : [String] = []
        guard let path1 = Bundle.main.path(forResource: "Video", ofType: "MOV") else {return [""]}
        guard let path2 = Bundle.main.path(forResource: "Video", ofType: "MOV") else {return [""]}
        guard let path3 = Bundle.main.path(forResource: "Video", ofType: "MOV") else {return [""]}
        guard let path4 = Bundle.main.path(forResource: "Video", ofType: "MOV") else {return [""]}
        guard let path5 = Bundle.main.path(forResource: "Video", ofType: "MOV") else {return [""]}
        
        tempVideoUrls.append(path1)
        tempVideoUrls.append(path2)
        tempVideoUrls.append(path3)
        tempVideoUrls.append(path4)
        tempVideoUrls.append(path5)
        return tempVideoUrls
    }

}
