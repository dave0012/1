//
//  Item.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/13.
//

import UIKit

struct Item {
    
    var itemImageUrl: URL?
    let itemID: String
    let itemTitle: String
    let itemPrice: String
    let caption: String
    let uid: String
    let likes: Int
    var timestamp: Date!
    let commentCount: Int
    
    init(itemID: String, dictionary: [String: Any]) {
        self.itemID = itemID
        
        self.itemTitle = dictionary["itemTitle"] as? String ?? ""
        self.itemPrice = dictionary["itemPrice"] as? String ?? ""

        self.caption = dictionary["caption"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.commentCount = dictionary["retweetCount"] as? Int ?? 0
        
        if let itemImageUrl = dictionary["itemImageUrl"] as? String {
            guard let url = URL(string: itemImageUrl) else { return }
            self.itemImageUrl = url
        }
        
        if let timestamp = dictionary["timestamp"] as? Double {
            self.timestamp = Date(timeIntervalSince1970: timestamp)
            
        }
    }
}
