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
        
        let insight1 = Insight(title: "Walmart's retail-tech ambitions", text: "Walmart yesterday announced the retail store of tomorrow, a futuristic confluence of traditional in-store shopping and AI led technology to support customers and employees, aimed at improving the experience and cutting customer inconvenience. The 50,000 square ft. pilot store with glossy screens, fancy self checkouts and unusual (borderline spooky) number of cameras is now open to customers in Long Island’s Levittown.", image: #imageLiteral(resourceName: "walmart"))
        
        let insight2 = Insight(title: "Pinterest IPO: The happiness social platform", text: "The pinterest IPO was a huge hit. Stock has been up 30% since trading began on Thursday this week.The platform is quite differentiating in its use and user base from the current social media landscape. Unlike other social media", image: #imageLiteral(resourceName: "pinterest"))
        let insight3 = Insight(title: "Amazon continues to smash investor expectations", text: "Amazon posted quite a strong quarterly report today making investors happy about the direction the company is headed in and its performance so far. Total revenue grew by 17% Y/Y for the quarter and Amazon’s profits increased by 116%.", image: #imageLiteral(resourceName: "amazon"))
        let insight4 = Insight(title: "Twitter report exceeds expectations", text: "Twitter surprised investors with better than expected performance on revenue and engagement in their quarterly earnings report this morning.", image: #imageLiteral(resourceName: "twitter"))
        let insight5 = Insight(title: "Zoom’s meteoric rise", text: "Zoom (ticker ZM and not ZOOM) - a video conferencing software provider which was one of the latest silicon valley unicorn startups to IPO in 2019 had a stellar launch with stock up more than 75% at debut. What makes the story even better is that the founder, now a billionaire, immigrated to the US from China 22 years ago as a lowly engineer and spoke very little English.", image: #imageLiteral(resourceName: "zoom"))
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewInsightViewController")as? ViewInsightViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
