//
//  ViewInsightViewController.swift
//  BoonDemo1
//
//  Created by Boon Invest on 4/26/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit

class ViewInsightViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var Title_lb: UILabel!
    @IBOutlet weak var Text_lb: UILabel!
    @IBOutlet weak var Image_view: UIImageView!

    var insightTitle = ""
    var insightText = ""
    var image = UIImage.init()

//    var titleLabel : UILabel = {
//        let view = UILabel()
//        view.frame = CGRect(x: 0, y: 0, width: 351, height: 59)
//        view.backgroundColor = .white
//        view.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
//        view.font = UIFont(name: "Montserrat-Regular", size: 25)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.widthAnchor.constraint(equalToConstant: 351).isActive = true
//        view.heightAnchor.constraint(equalToConstant: 59).isActive = true
//        view.textAlignment = .center
//        view.numberOfLines = 3
//        return view
//    }()
//
//    var imageDisplayContainer : UILabel = {
//        let view = UILabel()
//        view.frame = CGRect(x: 0, y: 0, width: 250, height: 144)
//        view.backgroundColor = .white
//        let layer0 = CALayer()
//        layer0.backgroundColor = UIColor(red: 0.77, green: 0.77, blue: 0.77, alpha: 1).cgColor
//        layer0.bounds = view.bounds
//        layer0.position = view.center
//        view.layer.addSublayer(layer0)
//        view.layer.cornerRadius = 10
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    var textLabel:UILabel = {
//    let view = UILabel()
//    return view
//    }()
    
    override func loadView() {
        super.loadView()

    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        titleLabel.text =  insightTitle
//        textLabel.text = insightText
//        let imageToDisplay = image.cgImage
//        let layer1 = CALayer()
//        layer1.contents = imageToDisplay
//        layer1.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1.11, b: 0, c: 0, d: 1, tx: -0.05, ty: 0))
//        layer1.bounds = imageDisplayContainer.bounds
//        layer1.position = imageDisplayContainer.center
//        imageDisplayContainer.layer.addSublayer(layer1)
//        imageDisplayContainer.layer.cornerRadius = 10
//
//        scrollView.addSubview(titleLabel)
////        titleLabel.widthAnchor.constraint(equalToConstant: 351).isActive = true
////        titleLabel.heightAnchor.constraint(equalToConstant: 59).isActive = true
//        titleLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10).isActive = true
//        titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5).isActive = true
//        titleLabel.rightAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 361).isActive = true
//
//        scrollView.addSubview(imageDisplayContainer)
//        imageDisplayContainer.widthAnchor.constraint(equalToConstant: 250).isActive = true
//        imageDisplayContainer.heightAnchor.constraint(equalToConstant: 144).isActive = true
//        imageDisplayContainer.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 60).isActive = true
//        imageDisplayContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
//        imageDisplayContainer.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 60).isActive = true
//
//        scrollView.addSubview(textLabel)
//
//        textLabel.textAlignment = .justified
//        let screensize: CGRect = UIScreen.main.bounds
//        let screenWidth = screensize.width
//        textLabel.frame = CGRect(x: 0, y: 0, width: screenWidth , height: 2000)
//        textLabel.backgroundColor = .white
//        textLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
//        textLabel.font = UIFont(name: "Montserrat-Regular", size: 14)
//        textLabel.numberOfLines = 0
//        textLabel.lineBreakMode = .byWordWrapping
//        textLabel.translatesAutoresizingMaskIntoConstraints = false
////        textLabel.widthAnchor.constraint(equalToConstant: 365).isActive = true
////        textLabel.heightAnchor.constraint(equalToConstant: 300).isActive = true
//        textLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10).isActive = true
//        textLabel.rightAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 350).isActive = true
//        textLabel.topAnchor.constraint(equalTo: imageDisplayContainer.bottomAnchor, constant: 30).isActive = true
//        textLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5).isActive = true
//
//        scrollView.contentSize = CGSize(width: screenWidth, height: 2000)
//        view.addSubview(scrollView)
//
//    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
            Title_lb.text =  insightTitle
            Text_lb.text = insightText
            let imageToDisplay = image.cgImage
            Image_view.image = image
        
        //scrollView.contentSize = CGSize(width: screenWidth, height: 2000)
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
