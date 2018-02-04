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
    
    func setPostDataNew(post:PhotoPost){
        
        super.setPostData(post: post)
    }
    
    func setPhoto (image: UIImage) {
        self.postImageView.contentMode = .scaleAspectFit
        let screenWidth = UIScreen.main.bounds.width
        let ratio =  CGFloat(image.size.height) / CGFloat(image.size.width)
        
        let newHeight = screenWidth * ratio
        let heightPostImageViewContraints = NSLayoutConstraint(item: self.postImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: newHeight)
        NSLayoutConstraint.activate([heightPostImageViewContraints])
        self.postImageView.image = image
        
    }
    
    override func setUI()  {
        super.setUI()
        
        contentView.addSubview(postImageView)
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Contraints for postImageView
        let topPostImageViewContraints = NSLayoutConstraint(item: postImageView, attribute: .top, relatedBy: .equal, toItem: blogNameLabel, attribute: .bottom, multiplier: 1.0, constant: 10)
        let leftPostImageViewContraints = NSLayoutConstraint(item: postImageView, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 10)
        let rightPostImageViewContraints = NSLayoutConstraint(item: postImageView, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1.0, constant: -10)
        let bottomPostImageViewContraints = NSLayoutConstraint(item: postImageView, attribute: .bottom, relatedBy: .equal, toItem: summaryLabel, attribute: .top, multiplier: 1.0, constant: -10)
        NSLayoutConstraint.activate([topPostImageViewContraints, leftPostImageViewContraints, rightPostImageViewContraints, bottomPostImageViewContraints])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        postImageView.af_cancelImageRequest()
        postImageView.layer.removeAllAnimations()
        postImageView.image = nil
    }
}

