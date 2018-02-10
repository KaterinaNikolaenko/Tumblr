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
    func getPostsAPI(tag: String, successCallback: @escaping ([Post]) -> (), errorCallback: @escaping (String) -> ()){
        
        postsArray.removeAll()
        Alamofire.request(Constants.URLs.baseURL + "tagged?tag=" + tag + "&api_key=" + Constants.URLs.apiKey, method: .get).responseJSON { (responseData) -> Void in
            
            guard responseData.response != nil else {
                errorCallback("Error!")
                return
            }
            if(!self.isSuccessStatus(status: (responseData.response?.statusCode)!)) {
                errorCallback("Error!")
                return
            }
            let json = JSON(responseData.result.value!)
            for item in json["response"].arrayValue {
                var tags: String = ""
                if item["tags"].arrayValue.count > 0 {
                    for itemTags in item["tags"].arrayValue {
                        tags = tags + " #" + itemTags.stringValue
                    }
                }
                
                switch item["type"].stringValue {
                case "photo":
                    var urlPhoto: String = ""
                    var width: Int = 0
                    var height: Int = 0
                    if item["photos"].arrayValue.count > 0 {
                        for itemPhotos in item["photos"].arrayValue {
                            urlPhoto = itemPhotos["original_size"]["url"].stringValue
                            width = itemPhotos["original_size"]["width"].intValue
                            height = itemPhotos["original_size"]["height"].intValue
                        }
                    }
                    self.postsArray.append(PhotoPost(blogName: item["blog_name"].stringValue, noteCount: item["note_count"].intValue, summary: item["summary"].stringValue, tags: tags, urlPhoto: urlPhoto, width: width, height: height))
                case "video":
                    if item["video_url"].stringValue != "" {
                        self.postsArray.append(VideoPost(blogName: item["blog_name"].stringValue, noteCount: item["note_count"].intValue, summary: item["summary"].stringValue, tags: tags, urlVideo: item["video_url"].stringValue))
                    } else {
                        self.postsArray.append(VideoPost(blogName: item["blog_name"].stringValue, noteCount: item["note_count"].intValue, summary: item["summary"].stringValue, tags: tags, urlVideo: item["permalink_url"].stringValue))
                    }
                case "quote":
                    self.postsArray.append(QuotePost(blogName: item["blog_name"].stringValue, noteCount: item["note_count"].intValue, summary: item["summary"].stringValue, tags: tags, text: item["text"].stringValue))
                case "text":
                    self.postsArray.append(TextPost(blogName: item["blog_name"].stringValue, noteCount: item["note_count"].intValue, summary: item["summary"].stringValue, tags: tags, body: item["body"].stringValue))
                case "link":
                    self.postsArray.append(LinkPost(blogName: item["blog_name"].stringValue, noteCount: item["note_count"].intValue, summary: item["summary"].stringValue, tags: tags, url: item["url"].stringValue))
                case "chat":
                    self.postsArray.append(ChatPost(blogName: item["blog_name"].stringValue, noteCount: item["note_count"].intValue, summary: item["summary"].stringValue, tags: tags, body: item["body"].stringValue))
                case "answer":
                    self.postsArray.append(AnswerPost(blogName: item["blog_name"].stringValue, noteCount: item["note_count"].intValue, summary: item["summary"].stringValue, tags: tags, question: item["question"].stringValue, answer: item["answer"].stringValue))
                default: //audio
                    self.postsArray.append(AudioPost(blogName: item["blog_name"].stringValue, noteCount: item["note_count"].intValue, summary: item["summary"].stringValue, tags: tags, audioSourceUrl: item["audio_source_url"].stringValue))
                }
            }
            successCallback(self.postsArray)
        }
    }
    
    func isSuccessStatus(status:Int) -> Bool {
        return (status >= 200 && status < 300)
    }
}
