//
//  InitialViewController.swift
//  BoonDemo1
//
//  Created by Boon Invest on 5/4/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.performSegue(withIdentifier: "SignUpViewController", sender: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    

}
