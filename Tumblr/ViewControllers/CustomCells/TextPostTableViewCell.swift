//
//  TextPostTableViewCell.swift
//  Tumblr
//
//  Created by Katerina on 03.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import UIKit

class TextPostTableViewCell: PostTableViewCell {

    //UI
    let mainTextLabel = UILabel()
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUI()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override func setPostData(post:Post){
        super.setPostData(post: post)
        
        if let textPost = post as? TextPost {
            mainTextLabel.text = textPost.body
        } else if let chatPost = post as? ChatPost {
            mainTextLabel.text = chatPost.body
        } else if let quotePost = post as? QuotePost {
            mainTextLabel.text = quotePost.text
        } else if let linkPost = post as? LinkPost {
            mainTextLabel.text = linkPost.url
        } else if let answerPost = post as? AnswerPost {
            mainTextLabel.text = answerPost.answer + " " + answerPost.question
        }
    }
    
    override func setUI()  {
        super.setUI()
        
        mainTextLabel.font = Constants.Font.mainFont
        mainTextLabel.lineBreakMode = .byWordWrapping
        mainTextLabel.numberOfLines = 3
        
        contentView.addSubview(mainTextLabel)
        mainTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Contraints for mainTextLabel
        let topPostImageViewContraints = NSLayoutConstraint(item: mainTextLabel, attribute: .top, relatedBy: .equal, toItem: blogNameLabel, attribute: .bottom, multiplier: 1.0, constant: 10)
        let leftPostImageViewContraints = NSLayoutConstraint(item: mainTextLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 10)
        let rightPostImageViewContraints = NSLayoutConstraint(item: mainTextLabel, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1.0, constant: -10)
        let bottomPostImageViewContraints = NSLayoutConstraint(item: mainTextLabel, attribute: .bottom, relatedBy: .equal, toItem: summaryLabel, attribute: .top, multiplier: 1.0, constant: -10)
        NSLayoutConstraint.activate([topPostImageViewContraints, leftPostImageViewContraints, rightPostImageViewContraints, bottomPostImageViewContraints])
    }
}
