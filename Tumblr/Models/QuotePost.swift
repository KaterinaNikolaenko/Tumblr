//
//  QuotePost.swift
//  Tumblr
//
//  Created by Katerina on 03.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation

class QuotePost: Post {
    var text: String
    
    init(blogName: String, noteCount: Int, summary: String, tags: String, text: String) {
        self.text = text
        super.init(blogName: blogName, noteCount: noteCount, summary: summary, tags: tags)
        
    }
}
