//
//  UserService.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/07/06.
//

import Foundation
import UIKit
import Firebase

struct UserInfo {
    let profileName: String
    let profileImage: UIImage
}

class UserService {
    
    static let shared = UserService()
    
    func uploadUserInfo(user: UserInfo, completion: @escaping (Error?, DatabaseReference) -> Void) {
        let name = user.profileName
        let image = user.profileImage
        
        guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }
        // jpegData로 압축
        let filename = NSUUID().uuidString
        let storageRef = STORAGE_USER_IMAGES.child(filename)
        
        storageRef.putData(imageData, metadata: nil) { meta, error in
            storageRef.downloadURL { url, error in
                guard let imageUrl = url?.absoluteString else { return }
                
                guard let uid = Auth.auth().currentUser?.uid else { return }
                
                let values = ["uid": uid,
                              "profileImageUrl": imageUrl,
                              "profileName": name] as [String: Any]
                
                REF_USERS.child(uid).updateChildValues(values, withCompletionBlock: completion)
            }
        }
    }
    
    func fetchUserInfo(completion: @escaping(User) -> Void) {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            
            let user = User(dictionary: dictionary)
            completion(user)
        }
    }
}

