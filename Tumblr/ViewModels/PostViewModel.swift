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
    
    // private
    fileprivate var httpClient:HttpClient = HttpClient()
    
    override init() {
        let post1 = Post(blogName: "saskdraws", noteCount: 20, summary: "kjhdkjkdkfdksfkdsjfd", tags: "#gggg #ghjnn")
        let post2 = Post(blogName: "halloweenhalloweenhalloween", noteCount: 83, summary: "djnkkdsjds kjdks jkndskjs", tags: "#comik")
        let post3 = Post(blogName: "tango2010weibo", noteCount: 5, summary: "That feeling you get during a dry spell on Tumblr, save for that one sole spike in likes and reblogs.", tags: "#bilbo baggins #gif")
        postsArray.append(post1)
        postsArray.append(post2)
        postsArray.append(post3)
        
        httpClient.getPosts { (postsArray) -> Void in
//            self.postsArray = postsArray
            print(postsArray.count)
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return postsArray.count
    }
}
