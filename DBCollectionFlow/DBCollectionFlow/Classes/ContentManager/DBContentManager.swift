//
//  DBContentManager.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 03/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit


class DBContentManager: NSObject {
    
    private let dataAccessObject:DBDataAccessObject

    
    override init() {
        self.dataAccessObject = DBDataAccessObject()
        
        super.init()
    }
    

// MARK: Public methods
    
    func loadItemsWithBlock(completion: (_ items: [DBInteractionObject]) -> Void) {
        completion(self.dataAccessObject.loadItemsForResourceName("items"))
    }
    
    func loadTextItemsWithBlock(completion: (_ items: [DBInteractionObject]) -> Void) {
        completion(self.dataAccessObject.loadItemsForResourceName("text_items"))
    }}
