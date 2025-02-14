//
//  InsightViewController.swift
//  BoonDemo1
//
//  Created by Shreya Navelkar on 4/20/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit
import Firebase

class InsightViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var insights:[Insight] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        createArray()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()

        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func  createArray(){
        let db = Firestore.firestore()
        let storage = Storage.storage()
        db.collection("insights").getDocuments(){
            (querySnapshot, error) in
            if let error = error{
                print("Error getting documents: \(error)")
            }else{
                for document in querySnapshot!.documents{
                    let title = document.data()["title"] as? String ?? ""
                    
                    let text = document.data()["text"] as? String ?? ""
                    
                    let url = document.data()["imageUrl"] as?  String ?? ""
                    
                    let gsReference = storage.reference(forURL: url)
                    let insightUrl = document.data()["url"] as? String ?? ""
                    
                    gsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
                        if let error = error {
                            print("Error getting documents: \(error)")
                        } else {
                            let image = UIImage(data: data!)
                            
                            let insight = Insight(title: title, text: text, image: image!, url: insightUrl)
                            
                            self.insights.append(insight)
                        }
                        self.tableView.reloadData()
                    }
                }
            }
        }

    }
}

extension InsightViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return insights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let insight = insights[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "insightTableViewCell")as!InsightTableViewCell
        
        cell.setInsight(insight: insight)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewInsightViewController")as? ViewInsightViewController
        let insight = insights[indexPath.row]
        vc?.insightUrl = insight.url
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
}
