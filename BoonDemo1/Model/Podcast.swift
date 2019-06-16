//
//  Podcast.swift
//  BoonDemo1
//
//  Created by Shreya Navelkar on 5/27/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import Foundation
import UIKit

class Podcast{
    var image : UIImage
    var title : String
    var shortDesc : String
    var podcastUrl : String
    
    init(image : UIImage, title : String, shortDesc : String, podcastUrl : String) {
        self.image = image
        self.title = title
        self.shortDesc = shortDesc
        self.podcastUrl = podcastUrl
    }
    
}

