//
//  VideoImageView.swift
//  BoonDemo1
//
//  Created by Boon Invest on 4/28/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class VideoImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    func loadVideo(path : String){
        let videoUrl = URL(fileURLWithPath: path)
        let player = AVPlayer(url: videoUrl)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view!.bounds
        self.view!.layer.addSublayer(playerLayer)
        player.play()
        
    

}
