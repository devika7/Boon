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
    
    func setVideo(video: Video){
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 124, height: 86)
        view.backgroundColor = .white
        
        
        let shadows = UIView()
        shadows.frame = view.frame
        shadows.clipsToBounds = false
        view.addSubview(shadows)
        
        
        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 20)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.03).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 1
        layer0.shadowOffset = CGSize(width: 0, height: 4)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)
        
        
        let shapes = UIView()
        shapes.frame = view.frame
        shapes.clipsToBounds = true
        view.addSubview(shapes)
        
        
        let layer1 = CALayer()
        layer1.backgroundColor = UIColor(red: 0.77, green: 0.77, blue: 0.77, alpha: 1).cgColor
        layer1.bounds = shapes.bounds
        layer1.position = shapes.center
        shapes.layer.addSublayer(layer1)
        
        
        let image2 = video.image.cgImage
        let layer2 = CALayer()
        layer2.contents = image2
        layer2.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1.02, b: 0, c: 0, d: 1, tx: -0.01, ty: 0))
        layer2.bounds = shapes.bounds
        layer2.position = shapes.center
        shapes.layer.addSublayer(layer2)
        
        
        shapes.layer.cornerRadius = 20
        shapes.layer.borderWidth = 1
        shapes.layer.borderColor = UIColor(red: 0.2, green: 0.8, blue: 0.65, alpha: 0.3).cgColor
        
        let image3 = UIImage(named: "videoPlay")?.cgImage
        
        let layer3 = CALayer()
        
        layer3.contents = image3
        
        layer3.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1, b: 0, c: 0, d: 1.23, tx: 0, ty: -0.12))
        
        layer3.bounds = CGRect(x: 0, y: 0, width: 80, height: 64)
        
        layer3.position = view.center
        
        view.layer.addSublayer(layer3)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        imageVideo.addSubview(view)
    }
}
