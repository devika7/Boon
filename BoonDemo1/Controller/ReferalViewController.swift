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
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubmitButton(enabled: false)
        referalEmailId.addTarget(self, action: #selector(enableSubmitButton), for: .editingChanged)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func enableSubmitButton(_ target : UITextField){
        let emailId = referalEmailId.text
        let emailIdPresent = emailId != nil && emailId != ""
        setSubmitButton(enabled : emailIdPresent)
        
    }
    
    func setSubmitButton(enabled: Bool){
        if enabled{
            submitButton.isEnabled = true
        }else{
             submitButton.isEnabled = false
        }
    }
    
    @IBAction func clickSubmit(_ sender: Any) {
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
