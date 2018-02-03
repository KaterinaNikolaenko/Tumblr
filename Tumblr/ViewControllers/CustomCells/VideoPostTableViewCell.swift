//
//  VideoPostTableViewCell.swift
//  Tumblr
//
//  Created by Katerina on 03.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import UIKit

class VideoPostTableViewCell: PostTableViewCell {

    //UI
    let videoUrlLabel = UILabel()
    var urlPost: String? = nil
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUI()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    func setPostData(post:VideoPost){
        super.setPostData(post: post)

        videoUrlLabel.text = post.urlVideo
        urlPost = post.urlVideo
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.onClicLabel(sender:)))
        videoUrlLabel.isUserInteractionEnabled = true
        videoUrlLabel.addGestureRecognizer(tap)
    }
    
    @objc func onClicLabel(sender:UITapGestureRecognizer) {
        let url = URL(string: urlPost!)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    override func setUI()  {
        super.setUI()
        
        videoUrlLabel.font = Constants.Font.mainFont
        videoUrlLabel.textColor = .blue
        
        contentView.addSubview(videoUrlLabel)
        videoUrlLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Contraints for mainTextLabel
        let topPostImageViewContraints = NSLayoutConstraint(item: videoUrlLabel, attribute: .top, relatedBy: .equal, toItem: blogNameLabel, attribute: .bottom, multiplier: 1.0, constant: 10)
        let leftPostImageViewContraints = NSLayoutConstraint(item: videoUrlLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 10)
        let rightPostImageViewContraints = NSLayoutConstraint(item: videoUrlLabel, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1.0, constant: -10)
        let bottomPostImageViewContraints = NSLayoutConstraint(item: videoUrlLabel, attribute: .bottom, relatedBy: .equal, toItem: summaryLabel, attribute: .top, multiplier: 1.0, constant: -10)
        NSLayoutConstraint.activate([topPostImageViewContraints, leftPostImageViewContraints, rightPostImageViewContraints, bottomPostImageViewContraints])
    }
}
