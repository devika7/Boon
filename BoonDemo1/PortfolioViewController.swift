//
//  PortfolioViewController.swift
//  BoonDemo1
//
//  Created by Boon Invest on 4/27/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit

class PortfolioViewController: UIViewController {
    
    var portfolios:[Portfolio] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        portfolios = createPortfolio()
        // Do any additional setup after loading the view.
    }
    
    func createPortfolio() -> [Portfolio]{
        var tempPortfolios:[Portfolio] = []
        
        let portfolio1 = Portfolio(title: "WMT", price: "+2.50", moneyInvested : "320")
        let portfolio5 = Portfolio(title: "MSFT", price: "+3.45", moneyInvested: "300")
        let portfolio2 = Portfolio(title: "TWTR", price: "-0.25", moneyInvested: "100")
        let portfolio3 = Portfolio(title: "AMZN", price: "+0.67", moneyInvested: "150")
        let portfolio4 = Portfolio(title: "LULU", price: "+0.89", moneyInvested: "130")
        tempPortfolios.append(portfolio1)
        tempPortfolios.append(portfolio2)
        tempPortfolios.append(portfolio3)
        tempPortfolios.append(portfolio4)
        tempPortfolios.append(portfolio5)
        
        return tempPortfolios
        
    }

}

extension PortfolioViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return portfolios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let portfolio = portfolios[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "portfolioTableViewCell")as!PortfolioTableViewCell
        cell.setPortfolio(portfolio: portfolio)
        return cell
    }
    
}


