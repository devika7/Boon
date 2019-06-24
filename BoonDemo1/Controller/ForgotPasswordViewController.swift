//
//  ForgotPasswordViewController.swift
//  BoonDemo1
//
//  Created by Muhammad Omair Nadiadwala on 23/06/2019.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit
import Firebase

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailIdField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func clickContinue(_ sender: Any) {
        
        
        Auth.auth().sendPasswordReset(withEmail:emailIdField.text!) { error in
            // Your code here
            
            if error != nil{
                let resetFailedAlert = UIAlertController(title: "Reset Failed", message: "Error: \(String(describing: error?.localizedDescription))", preferredStyle: .alert)
                resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(resetFailedAlert, animated: true, completion: nil)
            }else {

                let resetEmailSentAlert = UIAlertController(title: "Reset email sent successfully", message: "Check your email", preferredStyle: .alert)
                
                let action1 = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                    print("You've pressed default");
                    self.dismiss(animated: true, completion: nil)

                }
                
                resetEmailSentAlert.addAction(action1)
                self.present(resetEmailSentAlert, animated: true, completion: nil)
                

                
                
            }

            
        }
        
        
    }


    @IBAction func clickback(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
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
