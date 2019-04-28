//
//  MenuView.swift
//  BoonDemo1
//
//  Created by Boon Invest on 4/28/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit
import RHSideButtons

class MenuView: UIView {
    
    fileprivate let triggerButtonMargin = CGFloat(85)
    
    var sideButtonsView: RHSideButtons?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Layout Buttons
        sideButtonsView?.setTriggerButtonPosition(CGPoint(x: bounds.width - triggerButtonMargin, y: bounds.height - triggerButtonMargin))
    }
    
    fileprivate func setup() {
        backgroundColor = UIColor.lightGray
    }
    
    func set(sideButtonsView view: RHSideButtons) {
        sideButtonsView = view
    }
}
