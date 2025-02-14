//
//  InsightTableViewCell.swift
//  BoonDemo1
//
//  Created by Shreya Navelkar on 4/21/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit

class InsightTableViewCell: UITableViewCell {
    
    @IBOutlet weak var insightTitle: UILabel!
    @IBOutlet weak var insightDesc: UILabel!
    @IBOutlet weak var insightImage: UIImageView!
    @IBOutlet weak var insightView: UIView!

    func setInsight(insight: Insight){
        // Rectangle 6.4
        for V : UIView in insightView.subviews {
            if V.tag == 99{
                V.removeFromSuperview()
            }
        }
        
        let view = UILabel()
        
        view.frame = CGRect(x: 0, y: 0, width: insightView.frame.size.width, height: insightView.frame.size.height)
        
        view.backgroundColor = .clear
        view.tag = 99
        
        let shadows = UIView()
        
        shadows.frame = view.frame
        
        shadows.clipsToBounds = false
        shadows.tag = 99
        view.addSubview(shadows)
        
        
        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 12)
        
        let layer0 = CALayer()
        
        layer0.shadowPath = shadowPath0.cgPath
        
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05).cgColor
        
        layer0.shadowOpacity = 1
        
        layer0.shadowRadius = 6
        
        layer0.shadowOffset = CGSize(width: 0, height: 4)
        
        layer0.bounds = shadows.bounds
        
        layer0.position = shadows.center
        
        shadows.layer.addSublayer(layer0)
        
        
        let shapes = UIView()
        
        shapes.frame = view.frame
        
        shapes.clipsToBounds = true
        shapes.tag = 99

        view.addSubview(shapes)
        
        
        let layer1 = CALayer()
        
        layer1.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        
        layer1.bounds = shapes.bounds
        
        layer1.position = shapes.center
        
        shapes.layer.addSublayer(layer1)
        
        
        shapes.layer.cornerRadius = 12
        
        shapes.layer.borderWidth = 1
        
        shapes.layer.borderColor = UIColor(red: 0.2, green: 0.8, blue: 0.65, alpha: 0.3).cgColor
        
        insightTitle.text = insight.title
        insightDesc.text = insight.text
        insightImage.image = insight.image
        
        insightView.addSubview(view)
        
        insightView.bringSubview(toFront: insightTitle)
        insightView.bringSubview(toFront: insightDesc)
        insightView.bringSubview(toFront: insightImage)
        
        insightTitle.font = UIFont(name: "Montserrat-Regular", size: 16)
        insightDesc.font = UIFont(name: "Montserrat-Regular", size: 13)
    }
}
