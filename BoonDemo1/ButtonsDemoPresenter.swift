//
//  ButtonsDemoPresenter.swift
//  BoonDemo1
//
//  Created by Boon Invest on 4/28/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import  Foundation

class ButtonsDemoPresenter: NSObject {
    
    weak var viewController: ViewController?
    
    init(viewController: ViewController) {
        self.viewController = viewController
        super.init()
    }
    
    func start() {
        perform(#selector(delayShow), with: nil, afterDelay: 1)
        perform(#selector(delayHide), with: nil, afterDelay: 2)
    }
    
    @objc func delayShow() {
        viewController?.castView().sideButtonsView?.showButtons()
    }
    
    @objc func delayHide() {
        viewController?.castView().sideButtonsView?.hideButtons()
    }
}
