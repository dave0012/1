//
//  Constant.swift
//  CarrotMarket
//
//  Created by 민호 on 2022/06/20.
//

import Firebase

let STORAGE_REF = Storage.storage().reference()
let STORAGE_ITEM_IMAGES = STORAGE_REF.child("item_images")
let STORAGE_USER_IMAGES = STORAGE_REF.child("user_images")


let DB_REF = Database.database().reference()
let REF_ITEMS = DB_REF.child("items")
let REF_USERS = DB_REF.child("users")
let REF_POSTS = DB_REF.child("posts")



// 물건 목록


