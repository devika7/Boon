//
//  InsightViewController.swift
//  BoonDemo1
//
//  Created by Shreya Navelkar on 4/20/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit

class InsightViewController: UIViewController {
    
     var insights:[Insight] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        insights = createArray()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func  createArray() -> [Insight] {
        var tempInsights: [Insight] = []
        
        let insight1 = Insight(title: "Uber IPO will be judged by LYFT standards", text: "The pinterest IPO was a huge hit. Stock has been up 30% since trading began on Thursday this week.The platform is quite differentiating in its use and user base from the current social media landscape. Unlike other social media")
        let insight2 = Insight(title: "Pinterest IPO: The happiness social platform", text: "The pinterest IPO was a huge hit. Stock has been up 30% since trading began on Thursday this week.The platform is quite differentiating in its use and user base from the current social media landscape. Unlike other social media")
        let insight3 = Insight(title: "BFIT: The rise of wellness and fitness", text: "The pinterest IPO was a huge hit. Stock has been up 30% since trading began on Thursday this week.The platform is quite differentiating in its use and user base from the current social media landscape. Unlike other social media")
        let insight4 = Insight(title: "LULU: Outstanding quarter and strong growth", text: "The pinterest IPO was a huge hit. Stock has been up 30% since trading began on Thursday this week.The platform is quite differentiating in its use and user base from the current social media landscape. Unlike other social media")
        let insight5 = Insight(title: "LYFT IPO and the train wreck", text: "The pinterest IPO was a huge hit. Stock has been up 30% since trading began on Thursday this week.The platform is quite differentiating in its use and user base from the current social media landscape. Unlike other social media")
        
        tempInsights.append(insight1)
        tempInsights.append(insight2)
        tempInsights.append(insight3)
        tempInsights.append(insight4)
        tempInsights.append(insight5)
        
        return tempInsights
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
}
