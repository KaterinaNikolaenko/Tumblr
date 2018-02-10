//
//  PhotoPostTableViewCell.swift
//  Tumblr
//
//  Created by Katerina on 03.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotoPostTableViewCell: PostTableViewCell {
   
    //UI
    let postImageView = UIImageView()
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUI()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    func setPostData(post:PhotoPost){
        super.setPostData(post: post)
        self.postImageView.contentMode = .scaleAspectFit
    }
    
    override func setUI()  {
        super.setUI()
        
        contentView.addSubview(postImageView)
        postImageView
            .topAnchor(equalTo: blogNameLabel.bottomAnchor, constant: 10)
            .leadingAnchor(equalTo: contentView.leadingAnchor, constant: 10)
            .trailingAnchor(equalTo: contentView.trailingAnchor, constant: -10)
            .bottomAnchor(equalTo: summaryLabel.topAnchor, constant: -10)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        postImageView.af_cancelImageRequest()
        postImageView.layer.removeAllAnimations()
        postImageView.image = nil
    }
}

