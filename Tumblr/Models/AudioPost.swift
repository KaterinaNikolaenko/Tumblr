//
//  AudioPost.swift
//  Tumblr
//
//  Created by Katerina on 03.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation

class AudioPost: Post {
    var audioSourceUrl: String
    
    init(blogName: String, noteCount: Int, summary: String, tags: String, audioSourceUrl: String) {
        self.audioSourceUrl = audioSourceUrl
        super.init(blogName: blogName, noteCount: noteCount, summary: summary, tags: tags)
    }
}
