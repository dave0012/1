//
//  Post.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/07/06.
//

import Foundation

struct Post {
    let caption: String
    let postID: String
    
    
    init(postID: String, dictionary: [String: Any]) {
       
        self.postID = dictionary["postID"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
        
    
        }
    }

