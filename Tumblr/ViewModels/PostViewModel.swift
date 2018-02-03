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
    
    // Get all posts by tag from API
    func getPosts(tag: String, completion: @escaping (Bool) -> ()) {

        httpClient.getPostsAPI(tag: tag) { (postsArray) -> Void in
            self.postsArray = postsArray
            completion(true)
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return postsArray.count
    }
}
