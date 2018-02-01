//
//  Post.swift
//  Tumblr
//
//  Created by Katerina on 01.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation

class Post: NSObject {
    var blogName: String
    var imageUrl: String //Url
    var noteCount: Int
    var summary: String
    var tags: String
    
    
    init(blogName: String, imageUrl: String, noteCount: Int, summary: String, tags: String) {
        self.blogName = blogName
        self.imageUrl = imageUrl
        self.noteCount = noteCount
        self.summary = summary
        self.tags = tags
    }
}
