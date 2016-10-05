//
//  DBContentManager.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 03/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit


class DBContentManager: NSObject {
    
    private enum ItemType: Int {
        case Text = 0
        case Image
        case URL
    }
    
    private struct Item {
        let itemText:String?
        let itemType:ItemType
        let itemImage:String?
        let itemURL:String?
        let itemURLTitle:String?
        
        init(data:Dictionary<String, Any>) {
            itemText = data["item_text"] as? String
            itemType = ItemType.init(rawValue: data["item_type"] as! Int)!
            itemImage = data["item_image"] as? String
            itemURL = data["item_URL"] as? String
            itemURLTitle = data["item_URL_title"] as? String
        }
    }
    

// MARK: Public methods
    
    public func loadItemsWithBlock(completion: (_ items: Array<DBInteractionObject>) -> Void) {
        let items = db_loadLocalJson()
        completion(items)
    }
    
    
// MARK: Private methods
    
    private func db_loadLocalJson() -> Array<DBInteractionObject> {
        let privateItems: Array<Dictionary<String, Any>> = [ ["item_text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac justo eu turpis maximus sollicitudin eget quis massa. Sed ac convallis enim. In ac turpis non lectus ullamcorper efficitur.",
                                                              "item_type": 0],
                                                             
                                                             ["item_text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac justo eu turpis maximus sollicitudin eget quis massa. Sed ac convallis enim.",
                                                              "item_type": 0],
                                                             
                                                             ["item_image": "alicante",
                                                              "item_type": 1],
                                                             
                                                             ["item_text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                                              "item_type": 0],
                                                             
                                                             ["item_URL": "https://www.lonelyplanet.com/spain/valencia-and-murcia/alicante",
                                                              "item_URL_title": "LONELY PLANET: ALICANTE",
                                                              "item_type": 2],
                                                             
                                                             ["item_text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce molestie, lacus sed congue sollicitudin, nunc arcu imperdiet elit, nec vulputate libero mauris non urna. Aenean ac massa semper enim accumsan porta. Quisque ut dolor augue. Sed sodales non tortor a suscipit. Aliquam erat volutpat. Integer gravida arcu sed mollis placerat. Donec vulputate felis a egestas dignissim. Fusce urna odio, faucibus a risus sit amet, eleifend semper mi. Suspendisse varius sodales leo quis vulputate.",
                                                              "item_type": 0]
        ]

        var items:Array<DBInteractionObject> = Array()
        
        for privateItem:Dictionary<String, Any> in privateItems {
            let item:Item = Item.init(data: privateItem)
            
            switch item.itemType {
            case .Text:
                if let itemText = item.itemText {
                    items.append(DBInteractionObjectText.init(text: itemText))
                }
                break
                
            case .Image:
                if let itemImageName = item.itemImage {
                    items.append(DBInteractionObjectImage.init(imageName: itemImageName))
                }
                
                break
                
            case .URL:
                if let itemURL = item.itemURL, let itemURLTitle = item.itemURLTitle {
                    items.append(DBInteractionObjectURL(URL: itemURL, title: itemURLTitle))
                }
                break
            }
        }
        
        return items
    }
}
