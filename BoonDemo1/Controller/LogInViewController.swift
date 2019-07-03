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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleDismissButton(_ sender: Any) {
         self.dismiss(animated: false, completion: nil)
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
