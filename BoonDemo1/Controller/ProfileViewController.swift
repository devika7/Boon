//
//  ProfileViewController.swift
//  BoonDemo1
//
//  Created by Muhammad Omair Nadiadwala on 23/06/2019.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var AccountnoField: UITextField!
    @IBOutlet weak var emailIdField: UITextField!
    @IBOutlet weak var PhonenoField: UITextField!
    @IBOutlet weak var AddressField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        GetProfile()
    }
    
    
    func GetProfile(){
        let currentUser = Auth.auth().currentUser
        
        let uid = currentUser?.uid ?? ""

        let db = Firestore.firestore()
        db.collection("user").document(uid).getDocument{
            (querySnapshot, error) in
            if let error = error{
                print("Error getting documents: \(error)")
            }else{
                let name = String(format: "%@ %@", querySnapshot?.data()?["firstName"] as! String,querySnapshot?.data()?["lastName"] as! String)
                let emailAddress = querySnapshot?.data()?["emailAddress"] as! String
                let phoneNumber = querySnapshot?.data()?["phoneNumber"] as! String
                let streetAddress = querySnapshot?.data()?["streetAddress"] as! String
                print(streetAddress)
                
                self.NameField.text = name
                self.emailIdField.text = emailAddress
                self.PhonenoField.text = phoneNumber
                self.AddressField.text = streetAddress

                
            }
        }
    }

    
    @IBAction func Logout(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
        }
        catch {
            print(error)
        }
    }
    
    
    
    @IBAction func clickContinue(_ sender: Any) {
        var firstName = ""
        var LastName = ""
        
        if let nameArray = NameField.text?.split(separator: " "){
            if nameArray.count>1{
                firstName = String(nameArray[0])
                LastName = String(nameArray[1])
            }else if nameArray.count>0{
                firstName = String(nameArray[0])
            }else{
                firstName = ""
                LastName = ""
            }
        }else{
            firstName = NameField.text!
            LastName = String("")
        }
        
        let db = Firestore.firestore()
        let currentUser = Auth.auth().currentUser
        let uid = currentUser?.uid ?? ""
        let emailAddress = emailIdField.text ?? ""
        let changeRequest = currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = NameField.text ?? ""
        changeRequest?.commitChanges { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("profile updated")
            }
        }
        currentUser?.updateEmail(to: self.emailIdField.text!){(error) in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("profile updated")
            }
        }
        let docData: [String: Any] = [
            "firstName" : firstName ,
            "lastName" : LastName ,
            "emailAddress" : emailAddress,
            "phoneNumber" : PhonenoField.text ?? "",
            "streetAddress" : AddressField.text ?? "",
        ]
        db.collection("user").document(uid).setData(docData){ err in
            if let err = err {
                print("Error writing document: \(err)")
                
                let resetFailedAlert = UIAlertController(title: "Update Failed", message: "Error: \(String(describing: err.localizedDescription))", preferredStyle: .alert)
                resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(resetFailedAlert, animated: true, completion: nil)

            } else {
                print("Document successfully written!")
                
                let resetFailedAlert = UIAlertController(title: "successfully", message: "Profile update successfully", preferredStyle: .alert)
                resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(resetFailedAlert, animated: true, completion: nil)


            }
        }

    }

}
