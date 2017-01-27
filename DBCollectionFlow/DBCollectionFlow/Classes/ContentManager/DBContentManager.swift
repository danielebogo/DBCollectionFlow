//
//  DBContentManager.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 03/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit


typealias LoadItemsCompletionBlock = (_ response: DBDataAccessObjectResponse) -> Void

class DBContentManager: NSObject {
    
    private let _dataAccessObject:DBDataAccessObject
    
    override init() {
        self._dataAccessObject = DBDataAccessObject()
        super.init()
    }
    

// MARK: Public methods
    
    func loadItemsWithBlock(completion:LoadItemsCompletionBlock) {
        completion(self._dataAccessObject.loadItemsForResourceName("items"))
    }
    
    func loadTextItemsWithBlock(completion:LoadItemsCompletionBlock) {
        completion(self._dataAccessObject.loadItemsForResourceName("text_items"))
    }
}
