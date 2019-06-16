//
//  Portfolio.swift
//  BoonDemo1
//
//  Created by Boon Invest on 4/27/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import Foundation
import UIKit

class Portfolios: Decodable {
    let portfolios: [Portfolio]
    
    
    init(portfolios:[Portfolio]){
        self.portfolios = portfolios
    }
}

class Portfolio: Decodable {
    let Ticker: String
    let Name: String
    let Price: Double
    let Return: Double
    
    
    
    init(Ticker: String, Name: String, Price: Double, Return: Double ){
        self.Ticker = Ticker
        self.Name = Name
        self.Price = Price
        self.Return = Return
    }
    
    
    
}
