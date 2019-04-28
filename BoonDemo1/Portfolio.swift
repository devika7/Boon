//
//  Portfolio.swift
//  BoonDemo1
//
//  Created by Boon Invest on 4/27/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import Foundation
import UIKit

class Portfolio{
    var stockTitle : String
    var stockPrice : String
    var stockMoneyInvested : String
    
    init(title : String, price : String, moneyInvested : String){
        self.stockTitle = title
        self.stockPrice = price
        self.stockMoneyInvested = moneyInvested
    }
}
