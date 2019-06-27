//
//  DetailViewController.swift
//  BoonDemo1
//
//  Created by Boon Invest on 6/2/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var goBack: UIButton!
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
    
    @IBAction func backToPortfolio(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
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
        initDetailView()
        // Do any additional setup after loading the view.
    }
    
    func initDetailView(){
        self.ticker.text =  tickerText
        self.companyName.text = companyNameText
        self.stockPrice.text = stockPriceText
        self.upDownField.text = upDownFieldText
        self.marketcap.text = marketcapText
        self.beta.text = betaText
        self.returnField.text = returnFieldText
        self.peRatio.text = peRatioText
        self.ytdField.text = ytdFieldText
        self.twoYearReturn.text = twoYearReturnText
        self.fiveYearReturn.text = fiveYearReturnText
        self.fiftyTwoWeekHigh.text = fiftyTwoWeekHighText
        self.fiftyTwoWeekLow.text = fiftyTwoWeekLowText
        self.shortdesc.text = shortdescText
        
        
    }

}
