//
//  LinkPost.swift
//  Tumblr
//
//  Created by Katerina on 03.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation

class LinkPost: Post {
    var url: String
    
    init(blogName: String, noteCount: Int, summary: String, tags: String, url: String) {
        self.url = url
        super.init(blogName: blogName, noteCount: noteCount, summary: summary, tags: tags)
        
    }
}
