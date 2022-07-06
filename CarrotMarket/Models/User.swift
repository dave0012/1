//
//  User.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/07/06.
//

import Foundation

struct User {
    
    var profileImageUrl: URL?
    var profileName: String
    
    init(dictionary: [String: Any]) {
        
        self.profileName = dictionary["profileName"] as? String ?? ""
        
        if let profileImageUrl = dictionary["profileImageUrl"] as? String {
            guard let url = URL(string: profileImageUrl) else { return }
            self.profileImageUrl = url
        }
    }
}
