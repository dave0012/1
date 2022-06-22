//
//  Service.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/20.
//

import Firebase

struct ItemCredentials {
    let image: UIImage
    let title: String
    let price: String
    let description: String
}

//struct Service {
//    
//    // MARK: - Uploads
//
//    static func saveItemInfo(item: Item, completion: @escaping (Error?) -> Void) {
//        
//        let data = [
//                    "itemUid": item.uid,
//                    "itemImage": item.itemImage,
//                    "title": item.itemTitle,
//                    "price": item.itemPrice,
//                    "description": item.itemDescirption,
//                    "location": item.location,
//                    "time": item.time] as [String : Any]
//        
//        COLLECTION_ITEM.document(item.uid).setData(data, completion: completion)
//    }
//}
