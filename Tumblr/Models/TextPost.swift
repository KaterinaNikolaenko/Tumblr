//
//  TestPost.swift
//  Tumblr
//
//  Created by Katerina on 03.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation

class TextPost: Post {
    var body: String
    
    init(blogName: String, noteCount: Int, summary: String, tags: String, body: String) {
        self.body = body
        super.init(blogName: blogName, noteCount: noteCount, summary: summary, tags: tags)
        
    }
}
