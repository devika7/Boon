//
//  VideoPlayerLayer.swift
//  BoonDemo1
//
//  Created by Boon Invest on 4/27/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit
import AVFoundation

class VideoPlayerLayer: UIView {
    var player: AVPlayer? {
        get {
            return playerLayer.player
        }
        
        set {
            playerLayer.player = newValue
        }
    }
    
    // 5 Override the layerClass
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
    // 6 Add accessor for playerLayer so you don't need to
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }

}
