//
//  ManageViewController.swift
//  BoonDemo1
//
//  Created by Muhammad Omair Nadiadwala on 30/06/2019.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit

class ManageViewController: UIViewController {

    @IBOutlet weak var Addfund_View: UIView!
    @IBOutlet weak var WITHDRAWFUNDS_View: UIView!
    @IBOutlet weak var Back: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SetView(UView: Addfund_View)
        SetView(UView: WITHDRAWFUNDS_View)
        
        let button = UIButton(type: .custom)
        let image = UIImage(named: "backArrow")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        Back.tintColor = hexStringToUIColor(hex: "#506E8D")

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
    
    @IBAction func clickback(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }

}
