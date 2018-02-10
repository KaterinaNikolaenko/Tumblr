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
        videoUrlLabel
            .topAnchor(equalTo: blogNameLabel.bottomAnchor, constant: 10)
            .leadingAnchor(equalTo: contentView.leadingAnchor, constant: 10)
            .trailingAnchor(equalTo: contentView.trailingAnchor, constant: -10)
            .bottomAnchor(equalTo: summaryLabel.topAnchor, constant: -10)
    }
}
