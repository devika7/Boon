//
//  AccountViewController.swift
//  BoonDemo1
//
//  Created by Shreya Navelkar on 6/22/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit
import Firebase

class AccountViewController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var manageFundsButton: UIButton!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var accountNumber: UITextField!
    @IBOutlet weak var name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAccountDetails()
        // Do any additional setup after loading the view.
    }
    
    func loadAccountDetails(){
        let currentUser = Auth.auth().currentUser
        let uid = currentUser?.uid ?? ""
        let db = Firestore.firestore()
        db.collection("user").document(uid).getDocument(){(querySnapshot, error) in
            if let error = error{
                print("Error getting documents: \(error)")
            }else{
                self.name.text = currentUser?.displayName
                self.emailAddress.text = querySnapshot?.data()?["emailAddress"] as? String
                self.phoneNumber.text = querySnapshot?.data()?["phoneNumber"] as? String
                self.accountNumber.text = uid
                let cityState = querySnapshot?.data()?["cityState"] as? String ?? ""
                let streetAddress = querySnapshot?.data()?["streetAddress"] as? String ?? ""
                let zipCode = querySnapshot?.data()?["zipCode"] as? String ?? ""
                self.address.text = "\(streetAddress)" + "," + " \(cityState)" + "," + " \(zipCode)"
                self.reloadInputViews()
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
