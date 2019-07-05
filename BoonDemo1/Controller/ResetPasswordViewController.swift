//
//  ResetPasswordViewController.swift
//  BoonDemo1
//
//  Created by Shreya Navelkar on 6/16/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var enterNewPassword: UITextField!
    @IBOutlet weak var confirmNewPassword: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.isEnabled = false
        continueButton.alpha = 0.5
        enterNewPassword.addTarget(self, action: #selector(enableContinueButton), for: .editingChanged)
        confirmNewPassword.addTarget(self, action: #selector(enableContinueButton), for: .editingChanged)

        // Do any additional setup after loading the view.
    }
    
    @objc func enableContinueButton(_ target : UITextField){
        let newPassword = enterNewPassword.text
        let confirmPassword = confirmNewPassword.text
        let formFilled = newPassword != nil && confirmNewPassword != nil && confirmPassword == newPassword
        setContinueButton(enabled: formFilled)
        
    }
    
    func setContinueButton(enabled : Bool){
        if enabled{
            continueButton.isEnabled = true
            continueButton.alpha = 1.0
            
        }else{
            continueButton.isEnabled = false
            continueButton.alpha = 0.5
        }
    }
    
    @IBAction func clickContinueButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
        vc.newPassword = enterNewPassword.text!
        appDelegate.window?.rootViewController = vc
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{ // called when 'return' key pressed. return NO to ignore.
        enterNewPassword.resignFirstResponder()
        confirmNewPassword.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        self.view.endEditing(true)
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
