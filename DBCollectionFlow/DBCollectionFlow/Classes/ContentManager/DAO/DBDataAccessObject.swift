//
//  DBDataAccessObject.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 07/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit


enum DBDataAccessObjectResponse {
    static let errorMessageKey:String = "DBErrorMessageKey"
    
    case success(items:[DBInteractionObject])
    case error(error:NSError)
}


struct DBDataAccessObject {

    func loadItemsForResourceName(_ resourceName:String) -> DBDataAccessObjectResponse {
        if let path = Bundle.main.path(forResource:resourceName, ofType:"json") {
            do {
                let data = try NSData(contentsOf: URL(fileURLWithPath: path), options: NSData.ReadingOptions.mappedIfSafe)
                if let itemsArray = try? JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as! [[String:AnyObject]] {
                    return .success(items: self.db_mapItems(privateItems: itemsArray))
                } else {
                    return .error(error: NSError(domain: "com.bogodaniele.invalid.json", code: 406, userInfo: nil))
                }
            } catch let error as NSError {
                return .error(error: error)
            }
        }
        
        return .error(error: NSError(domain: "com.bogodaniele.invalid.filename.or.path", code: 404, userInfo: nil))
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
