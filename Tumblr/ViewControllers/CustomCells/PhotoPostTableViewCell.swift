//
//  PhotoPostTableViewCell.swift
//  Tumblr
//
//  Created by Katerina on 03.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import UIKit

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
        let imageURL = URL(string: post.urls[0])
//        DispatchQueue.global(qos: .utility).async{
            if let data = try? Data(contentsOf: imageURL!) {
//                DispatchQueue.main.async {
                    self.postImageView.contentMode = .scaleAspectFit
                    let screen_width = UIScreen.main.bounds.width
                    let ratio =  CGFloat((UIImage(data: data)?.size.height)!) / CGFloat((UIImage(data: data)?.size.width)!)
                    let newHeight = screen_width * ratio
                    let heightPostImageViewContraints = NSLayoutConstraint(item: self.postImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: newHeight)
                    NSLayoutConstraint.activate([heightPostImageViewContraints])
                    self.postImageView.image = UIImage(data: data)
//                }
//            }
        }
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
}

