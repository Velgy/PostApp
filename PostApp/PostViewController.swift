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
    var contentType: String!
    var likeLabel: String!
        
    private var mainView: PostView {
        return view as! PostView
    }
    
    override func loadView() {
        view = PostView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.imageView.downloaded(from: urlForAuthor)
        mainView.labelName.text = "Published by \(userName ?? "erorr")"
        mainView.labelText.text = textPost
        mainView.contentLabel.text = "Content type \(contentType ?? "erorr")"
        mainView.labelLike.text = "❤️\(likeLabel ?? "erorr")"
    }
    
}
