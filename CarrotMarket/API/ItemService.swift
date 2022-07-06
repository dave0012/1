//
//  Service.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/20.
//

import UIKit
import Firebase

struct ItemInfo {
    
    let itemImage: UIImage
    let itemTitle: String
    let itemPrice: String
    let itemCaption: String
    
}


class ItemService {
    
    static let shared = ItemService()
    
    func uploadItem(itemInfo: ItemInfo, completion: @escaping (Error?, DatabaseReference) -> Void) {
        
        let image = itemInfo.itemImage
        let title = itemInfo.itemTitle
        let price = itemInfo.itemPrice
        let caption = itemInfo.itemCaption
        
        guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }
        // jpegData로 압축
        let filename = NSUUID().uuidString
        let storageRef = STORAGE_ITEM_IMAGES.child(filename)
        
        storageRef.putData(imageData, metadata: nil) { meta, error in
            storageRef.downloadURL { url, error in
                guard let imageUrl = url?.absoluteString else { return }
                
                guard let uid = Auth.auth().currentUser?.uid else { return }
                
                let values = ["uid": uid,
                              "itemImageUrl": imageUrl,
                              "itemTitle": title,
                              "itemPrice": price,
                              "caption": caption] as [String: Any]
                
                REF_ITEMS.childByAutoId().updateChildValues(values, withCompletionBlock: completion)
            }
        }
    }
    
    func fetchItems(completion: @escaping([Item]) -> Void) {
        var items = [Item]()
        
        REF_ITEMS.observe((.childAdded)) { snapshot in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            guard let uid = dictionary["uid"] as? String else { return }
            let itemID = snapshot.key
            let item = Item(itemID: itemID, dictionary: dictionary)
            
            items.append(item)
            completion(items)
     
        }
    }
}
