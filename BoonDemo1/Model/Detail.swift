//
//  Detail.swift
//  BoonDemo1
//
//  Created by Boon Invest on 6/15/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//


import Foundation
import UIKit

class StockDetailView:Decodable{
    let stockdetailview:[Detail]
    
    init(stockDetailView : [Detail]) {
        self.stockdetailview = stockDetailView
    }
}

class Detail: Decodable {
    let ticker: String
    let companyname: String
    let shortdesc: String
    let ytdchangepercent: String
    let twoyrchangepercent: String
    let fiveyrchangepercent: String
    let weekhigh: String
    let weeklow:String
    let peratio:String
    let beta: String
    let marketcap: String
    
    //
    
    init(ticker: String, companyname: String, shortdesc: String, ytdchangepercent: String, twoyrchangepercent: String, fiveyrchangepercent: String, weekhigh: String,
         weeklow: String, peratio: String, beta: String, marketcap: String ){
        self.ticker = ticker
        self.companyname = companyname
        self.shortdesc = shortdesc
        self.ytdchangepercent = ytdchangepercent
        self.twoyrchangepercent = twoyrchangepercent
        self.fiveyrchangepercent = fiveyrchangepercent
        self.weekhigh = weekhigh
        self.weeklow = weeklow
        self.peratio = peratio
        self.beta = beta
        self.marketcap = marketcap
        
    }
    
    
    
}
