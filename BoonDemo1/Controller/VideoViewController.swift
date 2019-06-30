//
//  VideoViewController.swift
//  BoonDemo1
//
//  Created by Shreya Navelkar on 4/20/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import UIKit
import Firebase
import AVFoundation
import AVKit


class VideoViewController: UIViewController {
    
    var videos:[Podcast] = []
    var podcasts:[Podcast] = []
    var videoUrls:[String] = []
    var podcastUrls:[String] = []
    var podcasts_queue: [AVPlayerItem] = []
    var Video_queue: [AVPlayerItem] = []
    let videoPlayerViewController = AVPlayerViewController()

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

       //createVideos()
        createPodcast()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createVideos(){
        let db = Firestore.firestore()
        let storage = Storage.storage()
        db.collection("scoopPodcasts").getDocuments(){
            (querySnapshot, error) in
            if let error = error{
                print("Error getting documents: \(error)")
            }else{
                self.videos.removeAll()
                self.collectionView.reloadData()

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
                            
                            //self.videos.append(video)
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
                self.podcasts.removeAll()
                self.tableView.reloadData()
                self.videos.removeAll()
                self.Video_queue.removeAll()
                self.podcasts_queue.removeAll()
                self.collectionView.reloadData()

                for document in querySnapshot!.documents{
                    let imageUrl = document.data()["image"] as? String ?? ""
                     let shortDesc = document.data()["text"] as? String ?? ""
                     let title = document.data()["title"] as? String ?? ""
                    let podcastUrl = document.data()["podcastUrl"] as? String ?? ""
                    let isWatched = document.data()["isWatched"] as? Bool ?? false
                    let ID = document.documentID

                    let gsReference = storage.reference(forURL: imageUrl)
                    
                    gsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
                        if let error = error {
                            print("Error getting documents: \(error)")
                        } else {
                            // Data for "images/island.jpg" is returned
                            
                            
                            if isWatched
                            {
                                let image = UIImage(data: data!)
                                
                                
                                let podcast = Podcast(ID: ID, image: image!, title: title, shortDesc: shortDesc, podcastUrl: podcastUrl)
                                
                                self.podcasts.append(podcast)
                                self.podcasts_queue.append(AVPlayerItem(url: NSURL(string: podcast.podcastUrl)! as URL))


                            }else{
                                let image = UIImage(data: data!)
                                
                                
                                let podcast = Podcast(ID: ID,image: image!, title: title, shortDesc: shortDesc, podcastUrl: podcastUrl)
                                
                                self.videos.append(podcast)
                                self.Video_queue.append(AVPlayerItem(url: NSURL(string: podcast.podcastUrl)! as URL))

                            }
                            
                        }
                        self.tableView.reloadData()
                        self.collectionView.reloadData()
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
        
        //fix by omair
        
//            let vc = storyboard?.instantiateViewController(withIdentifier: "PlayVideoViewController")as? PlayVideoViewController
//            vc?.urlArray = videoUrls
//            vc?.selectedVideoUrl = videoUrls[indexPath.row]
//
//        let podcast = podcasts[indexPath.row]
//
//        loadVideo(firebaseUrl: podcast.podcastUrl)
//
//        for StringV:String in podcast.podcastUrl {
//
//            var queue: [AVPlayerItem] = []
//
//        }
        
        setVideoPlayer(queue: podcasts_queue)
        

//            self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    internal func setVideoPlayer(queue: [AVPlayerItem]) {
        let queuePlayer = AVQueuePlayer(items: queue)
//        let videoPlayerViewController = AVPlayerViewController()

        videoPlayerViewController.player = queuePlayer
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying(note:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: queue.last)
        
        


        self.present(videoPlayerViewController, animated: true) {
            self.videoPlayerViewController.player?.play()
        }
    }
    @objc func playerDidFinishPlaying(note: NSNotification) {
        // Your code here
        self.videoPlayerViewController.player?.pause()
//        self.videoPlayerViewController.removeFromParentViewController()
        
        self.videoPlayerViewController.dismiss(animated: true, completion: nil)
    }

    
    func loadVideo(firebaseUrl : String){
        let videoUrl = NSURL(string: firebaseUrl)
        let player = AVPlayer(url: videoUrl! as URL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true){
            playerViewController.player?.play()
            
        }
    }
    
}
extension VideoViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let video = videos[indexPath.row]
        //let podcast = podcasts[indexPath.row]

        //let video = Video(image: podcast.image, videoUrl: podcast.podcastUrl)
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCollectionViewCell", for: indexPath) as! VideoCollectionViewCell
        cell.setVideo(video: video)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "PlayVideoViewController")as? PlayVideoViewController
//        vc?.selectedVideoUrl = videos[indexPath.row].videoUrl
//        self.navigationController?.pushViewController(vc!, animated: true)
        
//        let podcast = videos[indexPath.row]
//
//        loadVideo(firebaseUrl: podcast.podcastUrl)
        
        setVideoPlayer(queue: Video_queue)

//        let db = Firestore.firestore()
//
//
//        db.collection("scoopPodcasts").document(podcast.ID).updateData(["isWatched" : true]){ err in
//            if let err = err {
//                print("Error writing document: \(err)")
//
//
//            } else {
//                print("Document successfully written!")
//
//
//
//            }
//        }

    }
    
    
    
    
}
