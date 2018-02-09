//
//  DetailsOfBlogViewController.swift
//  Tumblr
//
//  Created by Katerina on 03.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import UIKit

class DetailsOfBlogViewController: UIViewController {

    //UI
    let postImageView = UIImageView()
    let blogNameLabel = UILabel()
    var currentPost: Post? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - Private

extension DetailsOfBlogViewController {
    
    fileprivate func setUI()  {
        
        blogNameLabel.font = Constants.Font.mainFont
        blogNameLabel.textColor = UIColor.gray
        blogNameLabel.text = currentPost?.blogName ?? ""
        
        if let photoPost = currentPost as? PhotoPost {
            let imageURL = URL(string: photoPost.urls[0])
            DispatchQueue.global(qos: .utility).async{
                if let data = try? Data(contentsOf: imageURL!) {
                    DispatchQueue.main.async {
                        self.postImageView.image = UIImage(data: data)
                    }
                }
            }
        }
        self.view.addSubview(postImageView)
        self.view.addSubview(blogNameLabel)
        
        postImageView
            .topAnchor(equalTo: view.topAnchor, constant: 0)
            .leadingAnchor(equalTo: view.leadingAnchor, constant: 10)
            .trailingAnchor(equalTo: view.trailingAnchor, constant: -10)
            .bottomAnchor(equalTo: view.bottomAnchor, constant: -50)
        
        blogNameLabel
            .leadingAnchor(equalTo: view.leadingAnchor, constant: 10)
            .bottomAnchor(equalTo: view.bottomAnchor, constant: -10)
    }
}
