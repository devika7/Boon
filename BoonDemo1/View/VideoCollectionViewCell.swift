//
//  VideoCollectionViewCell.swift
//  BoonDemo1
//
//  Created by Shreya Navelkar on 5/27/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageVideo: UIImageView!
    
    func setVideo(video: Podcast){
        imageVideo.image = video.image
        imageVideo.layer.cornerRadius = imageVideo.frame.size.width / 2
        imageVideo.clipsToBounds = true
    }
}
