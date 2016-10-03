//
//  DBContentManager.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 03/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit


class DBContentManager: NSObject {
    
    enum ItemType: Int {
        case Text = 0
        case Image
    }
    
    struct Item {
        let itemText:String?
        let itemType:ItemType
        let itemImage:String?
        
        init(data:Dictionary<String, Any>) {
            itemText = data["item_text"] as? String
            itemType = ItemType.init(rawValue: data["item_type"] as! Int)!
            itemImage = data["item_image"] as? String
        }
    }
    

// MARK: Public methods
    
    public func loadItemsWithBlock(completion: (_ items: Array<Item>) -> Void) {
        let items = db_loadLocalJson()
        completion(items)
    }
    
    
// MARK: Private methods
    
    private func db_loadLocalJson() -> Array<Item> {
        let privateItems: Array<Dictionary<String, Any>> = [ ["item_text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac justo eu turpis maximus sollicitudin eget quis massa. Sed ac convallis enim. In ac turpis non lectus ullamcorper efficitur.",
                                                              "item_type": 0],
                                                             
                                                             ["item_text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac justo eu turpis maximus sollicitudin eget quis massa. Sed ac convallis enim.",
                                                              "item_type": 0],
                                                             
                                                             ["item_image": "alicante",
                                                              "item_type": 1],
                                                             
                                                             ["item_text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                                              "item_type": 0]
        ]

        
        var items:Array<Item> = Array()
        
        for privateItem:Dictionary<String, Any> in privateItems {
            let item:Item = Item.init(data: privateItem)
            items.append(item)
        }
        
        return items
    }
}
