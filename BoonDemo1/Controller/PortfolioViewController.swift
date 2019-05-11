//
//  PortfolioViewController.swift
//  BoonDemo1
//
//  Created by Boon Invest on 4/27/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit
import Firebase

class PortfolioViewController: UIViewController {
    
    var portfolios:[Portfolio] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        portfolios = createPortfolio()
        // Do any additional setup after loading the view.
    }
    
    func createPortfolio() -> [Portfolio]{
        var tempPortfolios:[Portfolio] = []
        let db = Firestore.firestore()
        db.collection("portfolio").getDocuments(){
            (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
//                    let ticker = document.data()["ticker"] as? String ?? ""
//                    let dailyReturns = document.data()["daily_returns"] as! Double
//                    let portfolio = Portfolio(ticker: ticker, dailyReturns: dailyReturns)
//                    tempPortfolios.append(portfolio)
                }
            }
        }
        print(tempPortfolios)
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


