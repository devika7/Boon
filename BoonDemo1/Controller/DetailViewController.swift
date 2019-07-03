//
//  DetailViewController.swift
//  BoonDemo1
//
//  Created by Boon Invest on 6/2/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var ticker: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var stockPrice: UILabel!
    @IBOutlet weak var upDownField: UILabel!
    @IBOutlet weak var returnField: UILabel!
    @IBOutlet weak var peRatio: UILabel!
    @IBOutlet weak var ytdField: UILabel!
    @IBOutlet weak var twoYearReturn: UILabel!
    @IBOutlet weak var fiveYearReturn: UILabel!
    @IBOutlet weak var fiftyTwoWeekHigh: UILabel!
    @IBOutlet weak var fiftyTwoWeekLow: UILabel!
    @IBOutlet weak var shortdesc: UILabel!
    @IBOutlet weak var beta: UILabel!
    @IBOutlet weak var marketcap: UILabel!
    @IBOutlet weak var Scroll_V: UIScrollView!
    private let refreshControl = UIRefreshControl()

    
    var tickerText = ""
    var companyNameText  = ""
    var stockPriceText = ""
    var upDownFieldText  = ""
    var marketcapText = ""
    var betaText  = ""
    var returnFieldText   = ""
    var peRatioText = ""
    var ytdFieldText = ""
    var twoYearReturnText  = ""
    var fiveYearReturnText = ""
    var fiftyTwoWeekHighText  = ""
    var fiftyTwoWeekLowText  = ""
    var shortdescText = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        Scroll_V.addSubview(refreshControl)

        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        initDetailView()

    }
    
    @objc func refresh(sender:AnyObject) {
        // Code to refresh table view
        self.shortdesc.sizeToFit()

        initDetailView()
    }

    
    func initDetailView(){
        self.ticker.text =  tickerText
        self.companyName.text = companyNameText
        self.stockPrice.text = stockPriceText
        
        guard let d = Double(returnFieldText) else { return }
        
        // Then implement your if statement
        if d > 0 {
            // Do what you want if d > 10
            self.upDownField.text = "UP"

        } else {
            // Do what you want if d <= 10
            self.upDownField.text = "DOWN"
        }

//        let test : AnyObject = returnFieldText as AnyObject
//        let rounded_down = floorf(test.floatValue * 10) / 10;
//        print(rounded_down)

        let roundof : AnyObject = returnFieldText as AnyObject

        let roundedValue1 = NSString(format: "%.2f", roundof.floatValue)
        print(roundedValue1) // prints 0.684

        
        self.marketcap.text = marketcapText
        self.beta.text = betaText
        self.returnField.text = "  " + (roundedValue1 as String)+"%" + " Today"
        self.peRatio.text = peRatioText
        self.ytdField.text = ytdFieldText
        self.twoYearReturn.text = twoYearReturnText
        self.fiveYearReturn.text = fiveYearReturnText
        self.fiftyTwoWeekHigh.text = fiftyTwoWeekHighText
        self.fiftyTwoWeekLow.text = fiftyTwoWeekLowText
        self.shortdesc.text = shortdescText
        
        print(shortdescText)
        
        self.refreshControl.endRefreshing()
        
        
    }
    
    @IBAction func clickback(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }


}
