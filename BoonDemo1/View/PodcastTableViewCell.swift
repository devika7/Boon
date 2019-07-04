//
//  PodcastTableViewCell.swift
//  BoonDemo1
//
//  Created by Shreya Navelkar on 5/28/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit

class PodcastTableViewCell: UITableViewCell {

    @IBOutlet weak var podcastImageView: UIImageView!
    @IBOutlet weak var podcastTitleLabel: UILabel!
    @IBOutlet weak var podcastShortDescLabel: UILabel!
    @IBOutlet weak var podcastShortView: UIView!

    func setPodcast(podcast: Podcast){
        podcastImageView.image = podcast.image
        podcastImageView.layer.cornerRadius = podcastImageView.frame.size.width / 2
        podcastImageView.clipsToBounds = true
        podcastShortView.layer.cornerRadius = 8
        podcastShortView.clipsToBounds = true
        podcastTitleLabel.text = podcast.title
        podcastShortDescLabel.text = podcast.shortDesc
    }
}

