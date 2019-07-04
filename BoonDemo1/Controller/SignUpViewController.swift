//
//  SignUpViewController.swift
//  BoonDemo1
//
//  Created by Boon Invest on 5/4/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailIdField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.isEnabled = false
        emailIdField.addTarget(self, action: #selector(enableLoginButton), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(enableLoginButton), for: .editingChanged)
    }
    
    @objc func enableLoginButton(_ target :UITextField){
        let emailId = emailIdField.text
        let password = passwordField.text
        let formFilled = emailId != nil && emailId != "" && password != ""
        setLoginButton(enabled: formFilled)
    }
    
    /**
     Enables or Disables the **sign up button**.
     */
    
    func setLoginButton(enabled:Bool) {
        if enabled {
            logInButton.isEnabled = true
        } else {
            logInButton.isEnabled = false
        }
    }
    
    var newUser:Bool = false
    
    
    @IBAction func clickLoginButton(_ sender: Any) {
        guard let email = emailIdField.text else { return }
        guard let password = passwordField.text else { return }
        var isNewUser:Bool = false
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if error == nil && user != nil {
                print("login successfull")
                let userDisplayName = Auth.auth().currentUser?.displayName
                if userDisplayName == nil{
                    isNewUser = true
                }
                if isNewUser {
                    print("New user")
                    self.newUser = true
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
                    
                }else{
                    print("Old User")
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                    
                }
            }
            else {
                print("Error logging in: \(error!.localizedDescription)")
                self.resetForm()
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{ // called when 'return' key pressed. return NO to ignore.
        emailIdField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        return true
    }
    
    func resetForm() {
        let alert = UIAlertController(title: "Error logging in", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        setLoginButton(enabled: true)
    }

    
}
