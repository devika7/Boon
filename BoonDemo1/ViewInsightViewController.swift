//
//  ViewInsightViewController.swift
//  BoonDemo1
//
//  Created by Boon Invest on 4/26/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit
import WebKit

class ViewInsightViewController: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var wkWebView: WKWebView!
    
    override func loadView() {
        super.loadView()
        let webConfiguration = WKWebViewConfiguration()
        wkWebView = WKWebView(frame: .zero, configuration: webConfiguration)
        wkWebView.uiDelegate = self
        view = wkWebView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let myURL = URL(string: "https://www.booninvest.co/post/walmart-s-retail-tech-ambitions")
        let myRequest = URLRequest(url: myURL!)
        wkWebView.load(myRequest)
        
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
