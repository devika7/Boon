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
    let url = "https://projectboon.herokuapp.com/portfolio/booninvestapi/?format=json"
    
     @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        downloadJson()
        // Do any additional setup after loading the view.
    }
    
    func downloadJson()
    {
        guard let downloadURL = URL(string: url) else { return }
        
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
    
}


