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
        blogNameLabel.textColor = UIColor.red
        blogNameLabel.text = currentPost?.blogName ?? ""
        
        postImageView.image = UIImage(named: "testImage") //Should delete!!!
        
        self.view.addSubview(postImageView)
        self.view.addSubview(blogNameLabel)
        
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        blogNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Contraints for postImageView
        let topPostImageViewContraints = NSLayoutConstraint(item: postImageView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0)
        let leftPostImageViewContraints = NSLayoutConstraint(item: postImageView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 10)
        let rightPostImageViewContraints = NSLayoutConstraint(item: postImageView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -10)
        let bottomPostImageViewContraints = NSLayoutConstraint(item: postImageView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -50)
        NSLayoutConstraint.activate([topPostImageViewContraints, leftPostImageViewContraints, rightPostImageViewContraints, bottomPostImageViewContraints])
        
        // Contraints for blogNameLabel
        let leadingBlogNameLabelContraints = NSLayoutConstraint(item: blogNameLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 10)
        let topBlogNameLabelContraints = NSLayoutConstraint(item: blogNameLabel, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -10)
        NSLayoutConstraint.activate([leadingBlogNameLabelContraints, topBlogNameLabelContraints])
    }
}
