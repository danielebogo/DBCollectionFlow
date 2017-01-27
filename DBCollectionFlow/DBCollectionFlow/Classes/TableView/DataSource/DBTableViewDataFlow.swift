//
//  DBTableViewDataSource.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 30/09/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit

class DBTableViewDataFlow: NSObject, UITableViewDelegate, UITableViewDataSource  {
    
    private let _target: UIViewController
    
    var items: [DBInteractionObject]?
    
    init(target:UIViewController) {
        self._target = target
        
        super.init()
        
        self.db_configureDataSource([])
    }
    
    init(target:UIViewController, data:[DBInteractionObject]) {
        self._target = target
        
        super.init()
        
        self.db_configureDataSource(data)
    }
    
    
// MARK: Private methods
    
    private func db_configureDataSource(_ data:[DBInteractionObject]) {
        self.items = data
    }
    
    
// MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let object = self.items![indexPath.row] as! DBInteractionObjectProtocol
        return object.tableView(tableView, cellForRowAt: indexPath, target: self._target)
    }
    
    
// MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let object = self.items![indexPath.row] as! DBInteractionObjectProtocol
        return object.cellSiseWithTableView(tableView, target: self._target)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = self.items![indexPath.row]
        
        if object is DBInteractionObjectSelectionProtocol {
            (object as! DBInteractionObjectSelectionProtocol).target(self._target, tableView: tableView, didSelectRowAt: indexPath)
        }
    }
}
