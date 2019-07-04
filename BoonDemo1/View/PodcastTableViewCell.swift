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
        
//        let view = UILabel()
//        view.frame = CGRect(x: 0, y: 0, width: 120, height: 122)
//        view.backgroundColor = .white
//
//        let layer0 = CALayer()
//        layer0.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1).cgColor
//        layer0.bounds = view.bounds
//        layer0.position = view.center
//        view.layer.addSublayer(layer0)
//
//        let image1 = podcast.image.cgImage
//        let layer1 = CALayer()
//        layer1.contents = image1
//        layer1.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1, b: 0, c: 0, d: 1.02, tx: 0, ty: -0.01))
//        layer1.bounds = view.bounds
//        layer1.position = view.center
//        view.layer.addSublayer(layer1)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        podcastImageView.addSubview(view)
        podcastImageView.image = podcast.image
        podcastImageView.layer.cornerRadius = podcastImageView.frame.size.width / 2
        podcastImageView.clipsToBounds = true

        podcastShortView.layer.cornerRadius = 8
        podcastShortView.clipsToBounds = true

        
        
        podcastTitleLabel.text = podcast.title
        podcastShortDescLabel.text = podcast.shortDesc
    }
}

