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
    func toReadBlog()
}


class PostTableViewCell: UITableViewCell {
    
    //UI
    let postImageView = UIImageView()
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
    
    func setPostData(post:Post)
    {
        postImageView.image = UIImage(named: "testImage") //Should delete!!!
        blogNameLabel.text = post.blogName
        tagsLabel.text = post.tags
        summaryLabel.text = post.summary
        noteCountLabel.text = String(post.noteCount)
        noteLabel.text = " заметки"
    }
}

// MARK: - Private

extension PostTableViewCell {
    
    fileprivate func setUI()  {
        
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
        
        contentView.addSubview(postImageView)
        contentView.addSubview(blogNameLabel)
        contentView.addSubview(toReadButton)
        contentView.addSubview(summaryLabel)
        contentView.addSubview(tagsLabel)
        contentView.addSubview(noteCountLabel)
        contentView.addSubview(noteLabel)
        
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        blogNameLabel.translatesAutoresizingMaskIntoConstraints = false
        toReadButton.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        tagsLabel.translatesAutoresizingMaskIntoConstraints = false
        noteCountLabel.translatesAutoresizingMaskIntoConstraints = false
        noteLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Contraints for blogNameLabel
        let leadingBlogNameLabelContraints = NSLayoutConstraint(item: blogNameLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 10)
        let topBlogNameLabelContraints = NSLayoutConstraint(item: blogNameLabel, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 10)
        NSLayoutConstraint.activate([leadingBlogNameLabelContraints, topBlogNameLabelContraints])
        
        // Contraints for toReadButton
        let trailingReadButtonContraints = NSLayoutConstraint(item: toReadButton, attribute: .leading, relatedBy: .equal, toItem: blogNameLabel, attribute: .trailing, multiplier: 1.0, constant: 10)
        let topReadButtonContraints = NSLayoutConstraint(item: toReadButton, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 4)
        NSLayoutConstraint.activate([topReadButtonContraints, trailingReadButtonContraints])
        
        // Contraints for postImageView
        let topPostImageViewContraints = NSLayoutConstraint(item: postImageView, attribute: .top, relatedBy: .equal, toItem: blogNameLabel, attribute: .bottom, multiplier: 1.0, constant: 10)
        let leftPostImageViewContraints = NSLayoutConstraint(item: postImageView, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 10)
        let rightPostImageViewContraints = NSLayoutConstraint(item: postImageView, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1.0, constant: -10)
        let bottomPostImageViewContraints = NSLayoutConstraint(item: postImageView, attribute: .bottom, relatedBy: .equal, toItem: summaryLabel, attribute: .top, multiplier: 1.0, constant: -10)
        NSLayoutConstraint.activate([topPostImageViewContraints, leftPostImageViewContraints, rightPostImageViewContraints, bottomPostImageViewContraints])
        
        // Contraints for summaryLabel
        let leadingSummaryLabelContraints = NSLayoutConstraint(item: summaryLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 10)
        let trailingSummaryLabelContraints = NSLayoutConstraint(item: summaryLabel, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1.0, constant: -10)
        let bottomSummaryLabelContraints = NSLayoutConstraint(item: summaryLabel, attribute: .bottom, relatedBy: .equal, toItem: tagsLabel, attribute: .top, multiplier: 1.0, constant: -10)
        NSLayoutConstraint.activate([leadingSummaryLabelContraints, trailingSummaryLabelContraints, bottomSummaryLabelContraints])
        
        // Contraints for tagsLabel
        let leadingTagsLabelContraints = NSLayoutConstraint(item: tagsLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 10)
        let bottomTagsLabelContraints = NSLayoutConstraint(item: tagsLabel, attribute: .bottom, relatedBy: .equal, toItem: noteCountLabel, attribute: .top, multiplier: 1.0, constant: -10)
        NSLayoutConstraint.activate([leadingTagsLabelContraints, bottomTagsLabelContraints])
        
        // Contraints for noteCountLabel
        let leadingNoteCountLabelContraints = NSLayoutConstraint(item: noteCountLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 10)
        let bottomNoteCountLabelContraints = NSLayoutConstraint(item: noteCountLabel, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1.0, constant: -10)
        NSLayoutConstraint.activate([leadingNoteCountLabelContraints, bottomNoteCountLabelContraints])
        
        // Contraints for noteLabel
        let leadingNoteLabelContraints = NSLayoutConstraint(item: noteLabel, attribute: .leading, relatedBy: .equal, toItem: noteCountLabel, attribute: .trailing, multiplier: 1.0, constant: 5)
        let bottomNoteLabelContraints = NSLayoutConstraint(item: noteLabel, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1.0, constant: -10)
        NSLayoutConstraint.activate([leadingNoteLabelContraints, bottomNoteLabelContraints])
    }
    
    @objc fileprivate func readDetails(sender: UIButton!) {
        delegate?.toReadBlog()
    }
}
