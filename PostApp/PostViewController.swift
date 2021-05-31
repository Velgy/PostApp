//
//  PostViewController.swift
//  PostApp
//
//  Created by Valentin on 26.05.2021.
//

import UIKit
import AVKit

class PostViewController: UIViewController {
    
    var urlForAuthor: URL!
    var userName: String!
    var textPost: String!
    var urlForPostImage: URL!
    var player: AVPlayer!
    var playerViewController: AVPlayerViewController!
    
   

        
    private var mainView: PostView {
        return view as! PostView
    }
    
    override func loadView() {
        view = PostView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.imageView.downloaded(from: urlForAuthor)
       // mainView.postImage.downloaded(from: urlForPostImage)
        mainView.labelName.text = "Published by: \(userName ?? "erorr")"
        mainView.labelText.text = textPost

//        let videoURL = URL(string: "videoUrl")
//        player = AVPlayer(url: videoURL!)
//        playerViewController = AVPlayerViewController()
//        playerViewController.player = self.player
//        
//        playerViewController.view.frame = self.playerView.frame
//        playerViewController.player?.pause()
//        self.playerView.addSubview(playerViewController.view)
//        player.play()
    }
    
}
