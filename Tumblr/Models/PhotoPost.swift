//
//  PhotoPost.swift
//  Tumblr
//
//  Created by Katerina on 03.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation

class PhotoPost: Post {
    var urlPhoto: String
    var width: Int
    var height: Int
    
    init(blogName: String, noteCount: Int, summary: String, tags: String, urlPhoto: String, width: Int, height:Int) {
        self.urlPhoto = urlPhoto
        self.width = width
        self.height = height
        super.init(blogName: blogName, noteCount: noteCount, summary: summary, tags: tags)
    }
}

