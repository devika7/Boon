//
//  VideoCell.swift
//  BoonDemo1
//
//  Created by Shreya Navelkar on 4/20/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit

class podcastTableViewCell: UITableViewCell {

    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    
    func setPodcast(podcast: Podcast){
        videoImageView.image = podcast.image
        videoTitleLabel.text = podcast.title
    }
}
