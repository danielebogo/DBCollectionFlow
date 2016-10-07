//
//  Item.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 07/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import Foundation


enum ItemType: Int {
    case Text = 0
    case Image
    case URL
}

struct Item {
    let itemText:String?
    let itemType:ItemType
    let itemImages:[String]?
    let itemURL:String?
    let itemURLTitle:String?
    
    init(data:Dictionary<String, Any>) {
        itemText = data["item_text"] as? String
        itemType = ItemType.init(rawValue: data["item_type"] as! Int)!
        itemImages = data["item_images"] as? [String]
        itemURL = data["item_URL"] as? String
        itemURLTitle = data["item_URL_title"] as? String
    }
}
