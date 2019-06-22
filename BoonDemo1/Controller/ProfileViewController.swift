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
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var Submit: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        let emailAddress = currentUser?.email ?? ""
//        let Name = currentUser?.displayName ?? ""

        
        GetProfile()
    }
    
    
    func GetProfile(){
        let currentUser = Auth.auth().currentUser
        
        let uid = currentUser?.uid ?? ""

        let db = Firestore.firestore()
        //let storage = Storage.storage()
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

    
    
    @IBAction func clickContinue(_ sender: Any) {
        var nameArray = NameField.text?.split(separator: " ")
        let firstName = nameArray?[0]
        let LastName = nameArray?[1]
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
        currentUser?.updatePassword(to: self.passwordField.text!){(error) in
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
            "firstName" : firstName ?? "",
            "lastName" : LastName ?? "",
            "emailAddress" : emailAddress,
            "phoneNumber" : PhonenoField.text ?? "",
            "streetAddress" : AddressField.text ?? "",
//            "cityState" : cityAndState.text ?? "",
//            "zipCode" : zipCode.text ?? ""
        ]
        db.collection("user").document(uid).setData(docData){ err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")

            }
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

}
