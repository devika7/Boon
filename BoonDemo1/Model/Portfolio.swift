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
    var ticker : String
    var dailyReturns : Double
    
    init(ticker : String,  dailyReturns : Double){
        self.ticker = ticker
        self.dailyReturns = dailyReturns
    }
}
