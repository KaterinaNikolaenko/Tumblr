//
//  AudioPostTableViewCell.swift
//  Tumblr
//
//  Created by Katerina on 03.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import UIKit

class AudioPostTableViewCell: PostTableViewCell {

    //UI
    let audioUrlLabel = UILabel()
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUI()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    func setPostData(post:AudioPost){
        super.setPostData(post: post)
        
        audioUrlLabel.text = post.audioSourceUrl
    }
    
    override func setUI()  {
        super.setUI()
        
        audioUrlLabel.font = Constants.Font.mainFont
        
        contentView.addSubview(audioUrlLabel)  
        audioUrlLabel
            .topAnchor(equalTo: blogNameLabel.bottomAnchor, constant: 10)
            .leadingAnchor(equalTo: contentView.leadingAnchor, constant: 10)
            .trailingAnchor(equalTo: contentView.trailingAnchor, constant: -10)
            .bottomAnchor(equalTo: summaryLabel.topAnchor, constant: -10)
    }
}
