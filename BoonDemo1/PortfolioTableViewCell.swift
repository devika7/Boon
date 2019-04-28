//
//  PortfolioTableViewCell.swift
//  BoonDemo1
//
//  Created by Boon Invest on 4/27/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit

class PortfolioTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stockTitle: UILabel!
    @IBOutlet weak var stockPrice: UILabel!
    @IBOutlet weak var stockMoneyInvested: UILabel!
    
    func setPortfolio(portfolio: Portfolio){
        stockTitle.text = portfolio.stockTitle
        let stockPriceFloat = (portfolio.stockPrice as NSString).floatValue
        if stockPriceFloat < 0 {
            let color1 = hexStringToUIColor(hex : "#47BDA1")
            stockPrice.backgroundColor = color1
        }else if stockPriceFloat > 3.0{
            let color2 = hexStringToUIColor(hex : "#47BDA1")
            stockPrice.backgroundColor = color2
        }else{
             let color3 = hexStringToUIColor(hex : "#47BDA1")
            stockPrice.backgroundColor = color3
        }
        stockPrice.text = "\(portfolio.stockPrice)%"
        stockMoneyInvested.text = "$\(portfolio.stockMoneyInvested)"
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
