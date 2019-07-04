//
//  LogInViewController.swift
//  BoonDemo1
//
//  Created by Boon Invest on 5/4/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func handleDismissButton(_ sender: Any) {
         self.dismiss(animated: false, completion: nil)
    }

}
