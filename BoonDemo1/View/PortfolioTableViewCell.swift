//
//  PortfolioTableViewCell.swift
//  BoonDemo1
//
//  Created by Boon Invest on 4/27/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit

class PortfolioTableViewCell: UITableViewCell {
    @IBOutlet weak var tickerField: UILabel!
    @IBOutlet weak var dailyReturnDisplayField: UILabel!
    
    
    func setPortfolio(portfolio: Portfolio){
        tickerField.text = portfolio.Ticker
       let dailyReturns = String(format:"%.2f", (portfolio.Return * 100))
        if portfolio.Return < 0 {
            let color1 = hexStringToUIColor(hex : "#F8A1A1")
            dailyReturnDisplayField.backgroundColor = color1
        }else{
             let color3 = hexStringToUIColor(hex : "#C2F4E4")
                dailyReturnDisplayField.backgroundColor = color3
        }
        dailyReturnDisplayField.layer.masksToBounds = true
        dailyReturnDisplayField.layer.cornerRadius = 10
        dailyReturnDisplayField.text = "\(dailyReturns)%"
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
}
