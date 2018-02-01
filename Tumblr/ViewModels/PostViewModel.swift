//
//  PostViewModel.swift
//  Tumblr
//
//  Created by Katerina on 01.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation

class PostViewModel: NSObject {
    var postsArray = [Post]()
    override init() {
        let post1 = Post(blogName: "WWWWWWWWW", imageUrl: "sss", noteCount: 20, summary: "kjhdkjkdkfdksfkdsjfd", tags: "#gggg #ghjnn")
        let post2 = Post(blogName: "oooooooo", imageUrl: "jdkmdnd", noteCount: 83, summary: "djnkkdsjds kjdks jkndskjs", tags: "#comik")
        postsArray.append(post1)
        postsArray.append(post2)
    }
    
    func numberOfRowsInSection() -> Int {
        return postsArray.count
    }
}
