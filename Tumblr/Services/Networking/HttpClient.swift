//
//  HttpClient.swift
//  Tumblr
//
//  Created by Katerina on 02.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HttpClient{
    
    var postsArray = [Post]()
    
    //Get posts
    func getPosts(completion: @escaping ([Post]) -> ()){
        
        Alamofire.request(Constants.URLs.baseURL + "tagged?tag=lol&api_key=" + Constants.URLs.apiKey, method: .get).validate(contentType: ["application/json"]).responseJSON { (responseData) -> Void in
            
            if((responseData.result.value) != nil) {
                let json = JSON(responseData.result.value!)
                if json["meta"]["status"].intValue == 200 {
                    for item in json["response"].arrayValue {
                        print(item)
                        var tags: String = ""
                        if json["response"]["tags"].arrayValue.count > 0 {
                            for itemTags in json["response"]["tags"].arrayValue {
                                tags = tags + "#" + itemTags.stringValue
                            }
                        }
                        
                        self.postsArray.append(Post(blogName: item["blog_name"].stringValue, noteCount: item["note_count"].intValue, summary: item["summary"].stringValue, tags: tags))
                    }
                    completion(self.postsArray)
                }
            }
        }
    }
}
