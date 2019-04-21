//
//  InsightTableViewCell.swift
//  BoonDemo1
//
//  Created by Shreya Navelkar on 4/21/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit

class InsightTableViewCell: UITableViewCell {
    
    @IBOutlet weak var insightTitle: UILabel!
    @IBOutlet weak var insightDesc: UILabel!
    
    func setInsight(insight: Insight){
        insightTitle.text = insight.title
        insightDesc.text = insight.text
    }
}
