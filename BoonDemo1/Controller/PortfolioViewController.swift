//
//  PortfolioViewController.swift
//  BoonDemo1
//
//  Created by Boon Invest on 4/27/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit
import Firebase
//mport SnapKit



class PortfolioViewController: UIViewController {
    
    var portfolios:[Portfolio] = []
    var stockDetailView:[Detail] = []
    var currentValue:Int = 0
    var Userid:NSString = ""
    let urlToGetPortfolio = "https://projectboon.herokuapp.com/portfolio/booninvestapi/?format=json"
    
   let urlToGetStockDetails = "https://projectboon.herokuapp.com/portfolio/booninveststockpageapi/?format=json"
    
    private let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ValueLb: UITextField!
    @IBOutlet weak var UDValue_Lb: UILabel!
    @IBOutlet weak var UD_Lb: UILabel!
    @IBOutlet weak var Header_View: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Userid = Auth.auth().currentUser!.uid as NSString

        
        tableView.dataSource = self
        tableView.delegate = self
        downloadJsonStockDetails()
        downloadJson()
        
        //refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
        // not required when using UITableViewController
        tableView.estimatedSectionHeaderHeight = 40.0

        self.automaticallyAdjustsScrollViewInsets = false
        // Set a header for the table view
//        let header = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100))
//        header.backgroundColor = .red
        
        tableView.tableHeaderView = Header_View

        
//        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
//        statusBar.backgroundColor = .red
        
        let image3 = UIImage(named: "Group (1)")

        self.view.backgroundColor = UIColor(patternImage: image3!)
        tableView.backgroundColor = UIColor(patternImage: image3!)
//        tableView.bounces = false
        //tableView.isHidden = true
        
        let safeViewMargins = self.view.safeAreaLayoutGuide
        tableView.topAnchor.constraint(equalTo: safeViewMargins.topAnchor).isActive = false
        tableView.leadingAnchor.constraint(equalTo: safeViewMargins.leadingAnchor).isActive = false
        tableView.trailingAnchor.constraint(equalTo: safeViewMargins.trailingAnchor).isActive = false


        GetPortfolioUValue()

    }
    
    @objc func refresh(sender:AnyObject) {
        // Code to refresh table view
        downloadJsonStockDetails()
        downloadJson()
        GetPortfolioUValue()

    }
    
    
    func GetPortfolioUValue(){
        let db = Firestore.firestore()
        //let storage = Storage.storage()
        db.collection("userPortfolio").getDocuments(){
            (querySnapshot, error) in
            if let error = error{
                print("Error getting documents: \(error)")
            }else{
                for document in querySnapshot!.documents{
                    print(document.documentID)
                    
                    if self.Userid.isEqual(to: document.documentID)
                    {
                        self.currentValue = document.data()["currentValue"] as? Int ?? 0
                        print(self.currentValue)
                        let aStr = String(format: "%@%d", "$", self.currentValue)

                        self.ValueLb.text = aStr
                    }
//                    let gsReference = storage.reference(forURL: imageUrl)
//                    let videoUrl = document.data()["videoUrl"] as? String ?? ""
//                    self.videoUrls.append(videoUrl)
//                    gsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
//                        if let error = error {
//                            print("Error getting documents: \(error)")
//                        } else {
//                            // Data for "images/island.jpg" is returned
//                            let image = UIImage(data: data!)
//                            let video = Video(image: image!, videoUrl: videoUrl)
//
//                            self.videos.append(video)
//                        }
//                        self.collectionView.reloadData()
//                    }
                }
            }
        }
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
                    self.refreshControl.endRefreshing()
                }
            } catch let jsonErr {
                print("something went wrong after download",jsonErr)
                DispatchQueue.main.async { // Correct
                    self.refreshControl.endRefreshing()
                }

            }
            }.resume()
        self.tableView?.reloadData()
        
    }
    
    
}
extension PortfolioViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let v = UIView()
//        v.backgroundColor = .white
//        let segmentedControl = UISegmentedControl(frame: CGRect(x: 10, y: 5, width: tableView.frame.width - 20, height: 30))
//        segmentedControl.insertSegment(withTitle: "One", at: 0, animated: false)
//        segmentedControl.insertSegment(withTitle: "Two", at: 1, animated: false)
//        segmentedControl.insertSegment(withTitle: "Three", at: 2, animated: false)
//        v.addSubview(segmentedControl)
        
        let v = UIView()
        v.backgroundColor = .white

        let v_v = UIView()
        v_v.backgroundColor = .white

        v_v.frame = CGRect(x: 0, y: -45, width: tableView.frame.width, height: 80)

        let view = UILabel()
        view.frame = CGRect(x: 0, y: 35, width: tableView.frame.width, height: 40)
        view.backgroundColor = .clear
        let color1 = hexStringToUIColor(hex : "#506E8D")

        view.textColor = color1//UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        view.font = UIFont(name: "Montserrat-Regular", size: 18)
        view.text = "Stocks you own"
        //view.translatesAutoresizingMaskIntoConstraints = false
        //view.widthAnchor.constraint(equalToConstant: 351).isActive = true
        //view.heightAnchor.constraint(equalToConstant: 59).isActive = true
        view.textAlignment = .center
        view.numberOfLines = 3
        v_v.addSubview(view)
        v.addSubview(v_v)

        return v
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


