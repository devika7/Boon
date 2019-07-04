//
//  ManageViewController.swift
//  BoonDemo1
//
//  Created by Muhammad Omair Nadiadwala on 30/06/2019.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit
import Firebase

class ManageViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var Addfund_View: UIView!
    @IBOutlet weak var WITHDRAWFUNDS_View: UIView!
    @IBOutlet weak var Contact_View: UIView!
    @IBOutlet weak var Back: UIButton!
    @IBOutlet weak var Deposit_f: UITextField!
    @IBOutlet weak var withdrawal_f: UITextField!
    @IBOutlet weak var Contact_f: UITextField!

    @IBOutlet weak var Scroll_V: UIScrollView!
    @IBOutlet weak var Content_View: UIView!

    var deposit_msg: NSString!
    var deposit_Dmsg: NSString!
    var withdrawal_msg: NSString!
    var withdrawal_Dmsg: NSString!
    var Contact_msg: NSString!
    var Contact_Dmsg: NSString!
    var Message: NSString!
    var DMessage: NSString!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SetView(UView: Addfund_View)
        SetView(UView: WITHDRAWFUNDS_View)
        SetView(UView: Contact_View)

        //let Back = UIButton(type: .custom)
        let image = UIImage(named: "backArrow")?.withRenderingMode(.alwaysTemplate)
        Back.setImage(image, for: .normal)
        Back.tintColor = UIColor.black

        
        Scroll_V.contentSize.height = Content_View.frame.size.height

        
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    func SetView(UView : UIView) {
        // Rectangle
        
        
        let view = UILabel()
        
        view.frame = CGRect(x: 0, y: 0, width: UView.frame.size.width, height: UView.frame.size.height)
        
        view.backgroundColor = .clear
        
        //self.view = view
        
        
        let shadows = UIView()
        
        shadows.frame = view.frame
        
        shadows.clipsToBounds = false
        
        view.addSubview(shadows)
        
        
        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 12)
        
        let layer0 = CALayer()
        
        layer0.shadowPath = shadowPath0.cgPath
        
        layer0.shadowColor = UIColor(red: 0.7, green: 0.9, blue: 0.85, alpha: 1).cgColor
        
        layer0.shadowOpacity = 1
        
        layer0.shadowRadius = 28
        
        layer0.shadowOffset = CGSize(width: 0, height: 8)
        
        layer0.bounds = shadows.bounds
        
        layer0.position = shadows.center
        
        shadows.layer.addSublayer(layer0)
        
        
        let shapes = UIView()
        
        shapes.frame = view.frame
        
        shapes.clipsToBounds = true
        
        view.addSubview(shapes)
        
        
        let layer1 = CALayer()
        
        layer1.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        
        layer1.bounds = shapes.bounds
        
        layer1.position = shapes.center
        
        shapes.layer.addSublayer(layer1)
        
        
        shapes.layer.cornerRadius = 12

        
        let parent = UView
        
        parent.addSubview(view)
        parent.sendSubview(toBack: view)
        //view.translatesAutoresizingMaskIntoConstraints = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func clickSubmit(_ sender: UIButton) {
        
        let currentUser = Auth.auth().currentUser

        deposit_msg = String(format:"Hello BoonInvest, %@ (%@) has requested to deposit %@ in their portfolio on\nOnce the message is sent to us, the user should get a prompt stating",(currentUser?.displayName!)!, (currentUser?.email!)!,Deposit_f.text!) as NSString
        
        
        deposit_Dmsg = String(format:"Hello BoonInvest, %@ (%@), your request has been submitted successfully. The support team will deposit $amount as per end of the day value.",(currentUser?.displayName!)!, (currentUser?.email!)!,Deposit_f.text!) as NSString
        
        
        withdrawal_msg = String(format:"Hello BoonInvest, %@ (%@) has requested to withdraw %@ from their portfolio.",(currentUser?.displayName!)!, (currentUser?.email!)!,withdrawal_f.text!) as NSString
        
        
        withdrawal_Dmsg = String(format:"Hello %@, your request has been submitted successfully. The support team will deposit %@ as per end of the day value.",(currentUser?.displayName!)!,withdrawal_f.text!) as NSString

        Contact_msg = String(format:"Hello BoonInvest, %@ has the following message for you:\n%@",(currentUser?.displayName!)!,Contact_f.text!) as NSString
        
        
        Contact_Dmsg = String(format:"Hello %@, your request has been sent successfully. The support team will contact you within 24 hours.",(currentUser?.displayName!)!) as NSString

        
        if sender.tag == 1 {
            Message = deposit_msg
            DMessage = deposit_Dmsg
            Deposit_f.text = ""
        }else if sender.tag == 2{
            Message = withdrawal_msg
            DMessage = withdrawal_Dmsg
            withdrawal_f.text = ""
        }else{
            Message = Contact_msg
            DMessage = Contact_Dmsg
            Contact_f.text = ""

        }
        
        Submit()
    }

    
    func Submit()  {
        
        let currentUser = Auth.auth().currentUser

        let url_str = String(format:"https://slack.com/api/chat.postMessage?token=xoxb-685003272358-676512466545-cCI7yxCv4ye8BWUIzzAszn08&channel=booncustomersupport&text=%@&username=%@&pretty=1",Message, (currentUser?.displayName!)!)

        let Url = url_str.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)

        
        let task = URLSession.shared.dataTask(with: NSURL(string: Url!)! as URL, completionHandler: { (data, response, error) -> Void in
            if ((error) == nil){
                DispatchQueue.main.async {
                    
                    
                    let db = Firestore.firestore()

                    let docData: [String: Any] = [
                        "Message" : self.Message ?? "",
                        "userID" : currentUser?.uid ?? "",
                    ]
                    db.collection("UserRequest").document().setData(docData){ err in
                        if let err = err {
                            print("Error writing document: \(err)")
                        } else {
                            print("Document successfully written!")
                            
                        }
                    }
                    
                    
                    // view instantition here.
                    let alert = UIAlertController(title: "Alert!", message: self.DMessage as String?, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }else{
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Alert!", message: error?.localizedDescription as String?, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        })
        task.resume()
    }
    
    @IBAction func clickback(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{ // called when 'return' key pressed. return NO to ignore.
        Deposit_f.resignFirstResponder()
        withdrawal_f.resignFirstResponder()
        Contact_f.resignFirstResponder()

        return true
    }

}
