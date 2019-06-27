//
//  Insight.swift
//  BoonDemo1
//
//  Created by Shreya Navelkar on 4/21/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import Foundation
import UIKit

class Insight {
    var title : String
    var text : String
    var image : UIImage
    var url : String
    
    init( title : String, text : String, image : UIImage, url : String){
        self.title = title
        self.text = text
        self.image = image
        self.url = url
    }
}
