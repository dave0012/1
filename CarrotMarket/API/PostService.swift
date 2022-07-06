//
//  PostService.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/07/06.
//

import Firebase

class PostService {
    static let shared = PostService()
    
    func uploadPost(caption: String, completion: @escaping(Error?, DatabaseReference) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let values = ["caption": caption] as [String : Any]
        
        REF_POSTS.child(uid).childByAutoId().updateChildValues(values, withCompletionBlock: completion)
    }
    
    
    func fetchPosts(completion: @escaping([Post]) -> Void) {
        
        var posts = [Post]()
        
        guard let uid = Auth.auth().currentUser?.uid else { return }

        
        REF_POSTS.child(uid).observe(.childAdded) { snapshot in
            
            
            let postID = snapshot.key
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            let post = Post(postID: postID, dictionary: dictionary)
            
            posts.append(post)
            completion(posts)
                
                // User의 스냅샷을 찍어서 user구조체도 가져옴
            }
        }
    }
