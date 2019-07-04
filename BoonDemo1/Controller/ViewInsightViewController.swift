//
//  ViewInsightViewController.swift
//  BoonDemo1
//
//  Created by Boon Invest on 4/26/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit
import WebKit

class ViewInsightViewController: UIViewController {

    @IBOutlet weak var insightView: WKWebView!
    var insightUrl = ""
    override func loadView() {
        super.loadView()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInsightUrl()
    }
    
    func loadInsightUrl(){
        let url = URL(string: insightUrl)
        let request = URLRequest(url: url!)
        insightView.load(request)
    }

}
