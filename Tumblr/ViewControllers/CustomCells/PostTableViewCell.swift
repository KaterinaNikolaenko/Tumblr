//
//  PostTableViewCell.swift
//  Tumblr
//
//  Created by Katerina on 01.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation
import UIKit

protocol BlogDelegate: class {
    func toReadBlog(sender: UIButton)
}

class PostTableViewCell: UITableViewCell {
    
    //UI
    let blogNameLabel = UILabel()
    let toReadButton = UIButton()
    let tagsLabel = UILabel()
    let summaryLabel = UILabel()
    let noteCountLabel = UILabel()
    let noteLabel = UILabel()
    
    weak var delegate: BlogDelegate?
    
     // MARK: - LifeCycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        setUI()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    func setPostData(post: Post){
        
        blogNameLabel.text = post.blogName
        tagsLabel.text = post.tags
        summaryLabel.text = post.summary
        noteCountLabel.text = String(post.noteCount)
        noteLabel.text = " заметки"
    }
    
    func setUI()  {
        
        blogNameLabel.font = Constants.Font.mainFont
        blogNameLabel.textColor = UIColor.gray
        
        toReadButton.backgroundColor = .clear
        toReadButton.setTitle("Читать", for: .normal)
        toReadButton.titleLabel?.font = Constants.Font.mainFont
        toReadButton.setTitleColor(UIColor.blue, for: .normal)
        toReadButton.addTarget(self, action: #selector(readDetails), for: .touchUpInside)
        
        summaryLabel.font = Constants.Font.mainFont
        summaryLabel.lineBreakMode = .byWordWrapping
        summaryLabel.numberOfLines = 3
        
        tagsLabel.font = Constants.Font.mainFont
        tagsLabel.textColor = UIColor.gray
        
        noteCountLabel.font = Constants.Font.mainFont
        noteLabel.font = Constants.Font.mainFont
        
        contentView.addSubview(blogNameLabel)
        contentView.addSubview(toReadButton)
        contentView.addSubview(summaryLabel)
        contentView.addSubview(tagsLabel)
        contentView.addSubview(noteCountLabel)
        contentView.addSubview(noteLabel)
        
        blogNameLabel
            .leadingAnchor(equalTo: contentView.leadingAnchor, constant: 10)
            .topAnchor(equalTo: contentView.topAnchor, constant: 10)
        
        toReadButton
            .leadingAnchor(equalTo: blogNameLabel.trailingAnchor, constant: 10)
            .topAnchor(equalTo: contentView.topAnchor, constant: 4)
        
        summaryLabel
            .leadingAnchor(equalTo: contentView.leadingAnchor, constant: 10)
            .trailingAnchor(equalTo: contentView.trailingAnchor, constant: -10)
            .bottomAnchor(equalTo: tagsLabel.topAnchor, constant: -10)
       
        tagsLabel
            .leadingAnchor(equalTo: contentView.leadingAnchor, constant: 10)
            .bottomAnchor(equalTo: noteCountLabel.topAnchor, constant: -10)
       
        noteCountLabel
            .leadingAnchor(equalTo: contentView.leadingAnchor, constant: 10)
            .bottomAnchor(equalTo: contentView.bottomAnchor, constant: -10)
       
        noteLabel
            .leadingAnchor(equalTo: noteCountLabel.trailingAnchor, constant: 10)
            .bottomAnchor(equalTo: contentView.bottomAnchor, constant: -10)
    }
    
    @objc fileprivate func readDetails(sender: UIButton!) {
        delegate?.toReadBlog(sender: sender)
    }
}


