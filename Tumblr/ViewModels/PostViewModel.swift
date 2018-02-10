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
    var tappedPost: Post? = nil
    
    // private
    fileprivate var httpClient:HttpClient = HttpClient()
    
    // Get all posts by tag from API
    func getPosts(tag: String, completion: @escaping (Bool) -> ()) {
        
        postsArray.removeAll()
        httpClient.getPostsAPI(tag: tag, successCallback: { [unowned self] (postsArray) -> Void in
            self.postsArray = postsArray
            completion(true)
        }) { (error) -> Void in
            print(error)
            completion(false)
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return postsArray.count
    }
}
