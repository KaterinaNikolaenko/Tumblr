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
        audioUrlLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Contraints for mainTextLabel
        let topPostImageViewContraints = NSLayoutConstraint(item: audioUrlLabel, attribute: .top, relatedBy: .equal, toItem: blogNameLabel, attribute: .bottom, multiplier: 1.0, constant: 10)
        let leftPostImageViewContraints = NSLayoutConstraint(item: audioUrlLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 10)
        let rightPostImageViewContraints = NSLayoutConstraint(item: audioUrlLabel, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1.0, constant: -10)
        let bottomPostImageViewContraints = NSLayoutConstraint(item: audioUrlLabel, attribute: .bottom, relatedBy: .equal, toItem: summaryLabel, attribute: .top, multiplier: 1.0, constant: -10)
        NSLayoutConstraint.activate([topPostImageViewContraints, leftPostImageViewContraints, rightPostImageViewContraints, bottomPostImageViewContraints])
    }
}
