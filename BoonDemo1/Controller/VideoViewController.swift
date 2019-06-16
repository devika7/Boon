//
//  VideoViewController.swift
//  BoonDemo1
//
//  Created by Shreya Navelkar on 4/20/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit
import Firebase

class VideoViewController: UIViewController {
    
    var videos:[Video] = []
    var podcasts:[Podcast] = []
    var videoUrls:[String] = []
    var podcastUrls:[String] = []
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createVideos()
        createPodcast()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createVideos(){
        let db = Firestore.firestore()
        let storage = Storage.storage()
        db.collection("scoopVideos").getDocuments(){
            (querySnapshot, error) in
            if let error = error{
                print("Error getting documents: \(error)")
            }else{
                for document in querySnapshot!.documents{
                    let imageUrl = document.data()["videoImage"] as? String ?? ""
                    let gsReference = storage.reference(forURL: imageUrl)
                    let videoUrl = document.data()["videoUrl"] as? String ?? ""
                    self.videoUrls.append(videoUrl)
                    gsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
                        if let error = error {
                            print("Error getting documents: \(error)")
                        } else {
                            // Data for "images/island.jpg" is returned
                            let image = UIImage(data: data!)
                            let video = Video(image: image!, videoUrl: videoUrl)
                            
                            self.videos.append(video)
                        }
                        self.collectionView.reloadData()
                    }
                }
            }
        }
    }
    
    func createPodcast(){
        let db = Firestore.firestore()
        let storage = Storage.storage()
        db.collection("scoopPodcasts").getDocuments(){
            (querySnapshot, error) in
            if let error = error{
                print("Error getting documents: \(error)")
            }else{
                for document in querySnapshot!.documents{
                    let imageUrl = document.data()["image"] as? String ?? ""
                     let shortDesc = document.data()["text"] as? String ?? ""
                     let title = document.data()["title"] as? String ?? ""
                     let podcastUrl = document.data()["podcastUrl"] as? String ?? ""
                    
                    let gsReference = storage.reference(forURL: imageUrl)
                    
                    gsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
                        if let error = error {
                            print("Error getting documents: \(error)")
                        } else {
                            // Data for "images/island.jpg" is returned
                            let image = UIImage(data: data!)
                           
                            
                            let podcast = Podcast(image: image!, title: title, shortDesc: shortDesc, podcastUrl: podcastUrl)
                            
                            self.podcasts.append(podcast)
                        }
                        self.tableView.reloadData()
                    }
                }
            }
        }
        
    }
}

extension VideoViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return podcasts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let podcast = podcasts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PodcastTableViewCell") as! PodcastTableViewCell
        cell.setPodcast(podcast: podcast)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = storyboard?.instantiateViewController(withIdentifier: "PlayVideoViewController")as? PlayVideoViewController
            vc?.urlArray = videoUrls
            vc?.selectedVideoUrl = videoUrls[indexPath.row]
            self.navigationController?.pushViewController(vc!, animated: true)
    }
}
extension VideoViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let video = videos[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCollectionViewCell", for: indexPath) as! VideoCollectionViewCell
        cell.setVideo(video: video)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PlayVideoViewController")as? PlayVideoViewController
        vc?.selectedVideoUrl = videos[indexPath.row].videoUrl
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}
