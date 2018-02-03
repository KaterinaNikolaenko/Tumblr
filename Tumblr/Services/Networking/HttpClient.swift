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
    
    //Get posts
    func getPosts(completion: @escaping (Bool) -> ()){
        
        Alamofire.request(Constants.URLs.baseURL + "tagged?tag=lol&api_key=" + Constants.URLs.apiKey, method: .get).validate(contentType: ["application/json"]).responseJSON { (responseData) -> Void in
            
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
//                print(swiftyJsonVar)
            }
        }
    }
}
