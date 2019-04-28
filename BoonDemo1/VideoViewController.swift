//
//  VideoViewController.swift
//  BoonDemo1
//
//  Created by Shreya Navelkar on 4/20/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {
    
    var videos:[Video] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        videos = createArray()
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
    
    func createArray() -> [Video]{
        
        var tempVideos: [Video] = []
        
        let video1 = Video(image: #imageLiteral(resourceName: "uber"), title: "Uber IPO will be judged by LYFT standards")
        let video2 = Video(image: #imageLiteral(resourceName: "pintrest"), title: "Pinterest IPO: The happiness social platform")
        let video3 = Video(image: #imageLiteral(resourceName: "bfit etf"), title: "BFIT: The rise of wellness and fitness")
        let video4 = Video(image: #imageLiteral(resourceName: "lulu"), title: "LULU: Outstanding quarter and strong growth")
        let video5 = Video(image: #imageLiteral(resourceName: "lyft"), title: "LYFT IPO and the train wreck")
        
        tempVideos.append(video1)
        tempVideos.append(video2)
        tempVideos.append(video3)
        tempVideos.append(video4)
        tempVideos.append(video5)
        
        return tempVideos
        
    }
}

extension VideoViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return videos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let video = videos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! VideoCell
        cell.setVideo(video: video)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = storyboard?.instantiateViewController(withIdentifier: "PlayVideoViewController")as? PlayVideoViewController
            self.navigationController?.pushViewController(vc!, animated: true)
    }
}
