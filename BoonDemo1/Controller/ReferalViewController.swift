//
//  ReferalViewController.swift
//  BoonDemo1
//
//  Created by Shreya Navelkar on 6/15/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit
import Firebase

class ReferalViewController: UIViewController {

    @IBOutlet weak var referalEmailId: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubmitButton(enabled: false)
        referalEmailId.addTarget(self, action: #selector(enableSubmitButton), for: .editingChanged)
        scrollView.keyboardDismissMode = .onDrag
    }
    
    @objc func enableSubmitButton(_ target : UITextField){
        let emailId = referalEmailId.text ?? ""
        let emailIdPresent = emailId != "" && validateEmail(enteredEmail: emailId)
        setSubmitButton(enabled : emailIdPresent)
        
    }
    
    func validateEmail(enteredEmail:String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }
    
    func setSubmitButton(enabled: Bool){
        if enabled{
            submitButton.isEnabled = true
        }else{
             submitButton.isEnabled = false
        }
    }
  
    @IBAction func clickShare(_ sender: Any) {
        let db = Firestore.firestore()
        let data = ["referEmailId" : referalEmailId.text ?? "",
                    "userId" : Auth.auth().currentUser?.email ?? ""]
        db.collection("referralId").document().setData(data){
            err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
                self.resetForm()
            }
        }
    }
    
    
    func resetForm(){
        let alert = UIAlertController(title: "Thanks for sharing your love.", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok" , style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        self.referalEmailId.text?.removeAll()
        setSubmitButton(enabled : false)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{ // called when 'return' key pressed. return NO to ignore.
        referalEmailId.resignFirstResponder()
        return true
    }
    
}


