//
//  ViseoPost.swift
//  Tumblr
//
//  Created by Katerina on 03.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation

class ViseoPost: Post {
    var urlVideo: String
    
    init(blogName: String, noteCount: Int, summary: String, tags: String, urlVideo: String) {
        self.urlVideo = urlVideo
        super.init(blogName: blogName, noteCount: noteCount, summary: summary, tags: tags)
        
    }
}
