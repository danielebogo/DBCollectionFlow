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
    

// MARK: Public methods
    
    func loadItemsWithBlock(completion: (_ items: [DBInteractionObject]) -> Void) {
        let items = db_loadLocalJson("items")
        completion(items)
    }
    
    func loadTextItemsWithBlock(completion: (_ items: [DBInteractionObject]) -> Void) {
        let items = db_loadLocalJson("text_items")
        completion(items)
    }

    
    
// MARK: Private methods
    
    private func db_loadLocalJson(_ resourceName:String) -> [DBInteractionObject] {
        if let path = Bundle.main.path(forResource: resourceName, ofType: "json") {
            do {
                let data = try NSData(contentsOf: URL(fileURLWithPath: path), options: NSData.ReadingOptions.mappedIfSafe)
                if let itemsArray = try? JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as! Array<Dictionary<String, Any>> {
                    return self.db_mapItems(privateItems: itemsArray)
                } else {
                    print("Could not get json from file, make sure that file contains valid json.")
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
        }

        return []
    }
    
    private func db_mapItems(privateItems: [[String: Any]]) -> [DBInteractionObject] {
        var items:Array<DBInteractionObject> = Array()
        
        for privateItem:[String: Any] in privateItems {
            let item:Item = Item.init(data: privateItem)
            
            switch item.itemType {
            case .Text:
                if let itemText = item.itemText {
                    items.append(DBInteractionObjectText.init(text: itemText))
                }
                break
                
            case .Image:
                if let itemImages = item.itemImages {
                    items.append(DBInteractionObjectImage.init(itemImages: itemImages))
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
