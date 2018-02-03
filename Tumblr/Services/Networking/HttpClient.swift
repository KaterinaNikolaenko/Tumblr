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
    func getPostsAPI(tag: String, completion: @escaping ([Post]) -> ()){
      
        postsArray.removeAll()
        Alamofire.request(Constants.URLs.baseURL + "tagged?tag=" + tag + "&api_key=" + Constants.URLs.apiKey, method: .get).validate(contentType: ["application/json"]).responseJSON { (responseData) -> Void in
            
            if((responseData.result.value) != nil) {
                let json = JSON(responseData.result.value!)
                if json["meta"]["status"].intValue == 200 {
                    for item in json["response"].arrayValue {
                        var tags: String = ""
                        if item["tags"].arrayValue.count > 0 {
                            for itemTags in item["tags"].arrayValue {
                                tags = tags + " #" + itemTags.stringValue
                            }
                        }
                        // Photo type of Post
                        if item["type"].stringValue == "photo" {
                            var photos = [String]()
                            if item["photos"].arrayValue.count > 0 {
                                for itemPhotos in item["photos"].arrayValue {
                                    photos.append(itemPhotos["original_size"]["url"].stringValue)
                                }
                            }
                            self.postsArray.append(PhotoPost(blogName: item["blog_name"].stringValue, noteCount: item["note_count"].intValue, summary: item["summary"].stringValue, tags: tags, urls: photos))
                        }
                            // Video type of Post
                        else if item["type"].stringValue == "video" {
                            self.postsArray.append(VideoPost(blogName: item["blog_name"].stringValue, noteCount: item["note_count"].intValue, summary: item["summary"].stringValue, tags: tags, urlVideo: item["video_url"].stringValue))
                        }
                            // Quote type of Post
                        else if item["type"].stringValue == "quote" {
                            self.postsArray.append(QuotePost(blogName: item["blog_name"].stringValue, noteCount: item["note_count"].intValue, summary: item["summary"].stringValue, tags: tags, text: item["text"].stringValue))
                        }
                            // Text type of Post
                        else if item["type"].stringValue == "text" {
                            self.postsArray.append(TextPost(blogName: item["blog_name"].stringValue, noteCount: item["note_count"].intValue, summary: item["summary"].stringValue, tags: tags, body: item["body"].stringValue))
                        }
                            // Link type of Post
                        else if item["type"].stringValue == "text" {
                            self.postsArray.append(LinkPost(blogName: item["blog_name"].stringValue, noteCount: item["note_count"].intValue, summary: item["summary"].stringValue, tags: tags, url: item["url"].stringValue))
                        }
                            // Chat type of Post
                        else if item["type"].stringValue == "text" {
                            self.postsArray.append(ChatPost(blogName: item["blog_name"].stringValue, noteCount: item["note_count"].intValue, summary: item["summary"].stringValue, tags: tags, body: item["body"].stringValue))
                        }
                            // Answer type of Post
                        else if item["type"].stringValue == "text" {
                            self.postsArray.append(AnswerPost(blogName: item["blog_name"].stringValue, noteCount: item["note_count"].intValue, summary: item["summary"].stringValue, tags: tags, question: item["question"].stringValue, answer: item["answer"].stringValue))
                        }
                            // Audio type of Post
                        else if item["type"].stringValue == "text" {
                            self.postsArray.append(AudioPost(blogName: item["blog_name"].stringValue, noteCount: item["note_count"].intValue, summary: item["summary"].stringValue, tags: tags, audioSourceUrl: item["audio_source_url"].stringValue))
                        }
                    }
                    completion(self.postsArray)
                }
            }
        }
    }
}
