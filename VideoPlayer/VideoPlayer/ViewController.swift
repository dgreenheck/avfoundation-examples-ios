//
//  ViewController.swift
//  VideoPlayer
//
//  Created by Daniel Greenheck on 1/11/20.
//  Copyright © 2020 Daniel Greenheck. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // Outlets
    @IBOutlet weak var videoContainerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    // Reference to the video player view controller
    let videoPlayerViewController = AVPlayerViewController()
    
    // A list of video names and filenames
    var videos = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        loadVideoList()
        configureVideoPlayer()
    }
    
    func configureVideoPlayer() {
        // Add the AVPlayerViewController to the container view
        videoPlayerViewController.view.frame = videoContainerView.bounds
        self.addChild(videoPlayerViewController)
        self.videoContainerView.addSubview(videoPlayerViewController.view)
        videoPlayerViewController.didMove(toParent: self)
    }
    
    func loadVideoList() {
        self.videos = ["rabbit","canyon","earth"]
    }
    
    func loadVideo(filename: String) {
        guard let url = Bundle.main.url(forResource: filename, withExtension: ".mp4") else { return }
        videoPlayerViewController.player = AVPlayer(url: url)
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        cell.textLabel?.text = videos[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        loadVideo(filename: videos[indexPath.row])
    }
}

