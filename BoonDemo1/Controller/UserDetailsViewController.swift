//
//  UserDetailsViewController.swift
//  BoonDemo1
//
//  Created by Shreya Navelkar on 6/16/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit
import Firebase

class UserDetailsViewController: UIViewController {

    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var streetAddress: UITextField!
    @IBOutlet weak var cityAndState: UITextField!
    @IBOutlet weak var zipCode: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    var newPassword = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.isEnabled = false
        continueButton.alpha = 0.5
        phoneNumber.addTarget(self, action: #selector(enableContinueButton), for: .editingChanged)
        fullName.addTarget(self, action: #selector(enableContinueButton), for: .editingChanged)
        streetAddress.addTarget(self, action: #selector(enableContinueButton), for: .editingChanged)
        cityAndState.addTarget(self, action: #selector(enableContinueButton), for: .editingChanged)
        zipCode.addTarget(self, action: #selector(enableContinueButton), for: .editingChanged)

        // Do any additional setup after loading the view.
    }
    
    @objc func enableContinueButton(_ target : UITextField){
        let phoneNumberText = phoneNumber.text
        let fullNameText = fullName.text
         let streetAddressText = streetAddress.text
         let cityAndStateText = cityAndState.text
        let zipCodeText = zipCode.text
        let formFilled = phoneNumberText != nil && fullNameText != nil &&  streetAddressText != nil && cityAndStateText != nil && zipCodeText != nil
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func clickContinue(_ sender: Any) {
       var nameArray = fullName.text?.split(separator: " ")
        let firstName = nameArray?[0]
        let LastName = nameArray?[1]
        let db = Firestore.firestore()
        let currentUser = Auth.auth().currentUser
        let uid = currentUser?.uid ?? ""
        let emailAddress = currentUser?.email ?? ""
        let changeRequest = currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = fullName.text ?? ""
        changeRequest?.commitChanges { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("profile updated")
            }
        }
        currentUser?.updatePassword(to: self.newPassword){(error) in
        }
        let docData: [String: Any] = [
            "firstName" : firstName ?? "",
            "lastName" : LastName ?? "",
            "emailAddress" : emailAddress,
            "phoneNumber" : phoneNumber.text ?? "",
            "streetAddress" : streetAddress.text ?? "",
            "cityState" : cityAndState.text ?? "",
            "zipCode" : zipCode.text ?? ""
        ]
        db.collection("user").document(uid).setData(docData){ err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")

            }
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
    }
    
    
}
