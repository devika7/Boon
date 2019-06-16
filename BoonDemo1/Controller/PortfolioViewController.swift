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
    var stockDetailView:[Detail] = []
    let urlToGetPortfolio = "https://projectboon.herokuapp.com/portfolio/booninvestapi/?format=json"
    
   let urlToGetStockDetails = "https://projectboon.herokuapp.com/portfolio/booninveststockpageapi/?format=json"
    private let refreshControl = UIRefreshControl()
    
     @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        downloadJsonStockDetails()
        downloadJson()
     
    }
    
        // Do any additional setup after loading the view
    func downloadJsonStockDetails()
    {
        guard let downloadURL = URL(string: urlToGetStockDetails) else { return }
        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, err) in
            print(urlResponse!)
            guard let data = data else {return}
            do
            {
                let downloadedDetails = try JSONDecoder().decode(StockDetailView.self, from:data)
                self.stockDetailView = downloadedDetails.stockdetailview
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
            } catch let jsonErr {
                print("something went wrong after download",jsonErr)
            }
            }.resume()
        self.tableView?.reloadData()
    }
    
    
    func downloadJson()
    {
        guard let downloadURL = URL(string: urlToGetPortfolio) else { return }
        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, err) in
            guard let data = data else {return}
            do
            {
                let downloadedPortfolios = try JSONDecoder().decode(Portfolios.self, from:data)
                self.portfolios = downloadedPortfolios.portfolios
                
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
            } catch let jsonErr {
                print("something went wrong after download",jsonErr)
            }
            }.resume()
        self.tableView?.reloadData()
    
        
        
    }
    
    
}
extension PortfolioViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return portfolios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let portfolio = self.portfolios[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "portfolioTableViewCell")as! PortfolioTableViewCell
        cell.setPortfolio(portfolio: portfolio)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        let portfolio = self.portfolios[indexPath.row]
        let tickerVal = portfolio.Ticker
        print(tickerVal)
        print("\(stockDetailView.count)")
        for details in self.stockDetailView{
            if details.ticker == tickerVal{
                detailVC?.tickerText = details.ticker
                detailVC?.companyNameText = portfolio.Name
                detailVC?.stockPriceText = "\(portfolio.Price)"
                detailVC?.upDownFieldText = "UP DOWN"
                detailVC?.marketcapText = details.marketcap
                detailVC?.betaText = details.beta
                detailVC?.returnFieldText = "\(portfolio.Return * 100)"
                detailVC?.peRatioText = details.peratio
                detailVC?.ytdFieldText = details.ytdchangepercent
                detailVC?.twoYearReturnText =  details.twoyrchangepercent
                detailVC?.fiveYearReturnText = details.fiveyrchangepercent
                detailVC?.fiftyTwoWeekHighText = details.weekhigh
                detailVC?.fiftyTwoWeekLowText = details.weeklow
                detailVC?.shortdescText = details.shortdesc
            }
        }
        self.navigationController?.pushViewController( detailVC! , animated: true)
        
        
    }
    
}


