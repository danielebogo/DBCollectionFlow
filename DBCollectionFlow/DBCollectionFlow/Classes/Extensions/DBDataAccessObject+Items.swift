//
//  DBDataAccessObject+Items.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 07/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit

extension DBDataAccessObject {

    
    func loadItemsForResourceName(_ resourceName:String) -> [DBInteractionObject] {
        if let path = Bundle.main.path(forResource:resourceName, ofType:"json") {
            do {
                let data = try NSData(contentsOf: URL(fileURLWithPath: path), options: NSData.ReadingOptions.mappedIfSafe)
                if let itemsArray = try? JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as! [[String:AnyObject]] {
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
    
    
//MARK: Private methods
    
    private func db_mapItems(privateItems: [[String: AnyObject]]) -> [DBInteractionObject] {
        var items:[DBInteractionObject] = Array()
        
        _ = privateItems.map {
            items.append(DBInteractionObjectType(with:$0).interactionObject)
        }
        
        return items
    }
}
