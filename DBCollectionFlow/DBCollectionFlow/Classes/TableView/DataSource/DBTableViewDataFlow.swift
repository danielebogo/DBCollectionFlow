//
//  DBTableViewDataSource.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 30/09/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit

class DBTableViewDataFlow: NSObject, UITableViewDelegate, UITableViewDataSource  {
    
    private let target_: UIViewController
    
    var items: Array<DBInteractionObject>?
    
    init(target:UIViewController) {
        self.target_ = target
        
        super.init()
        
        self.db_configureDataSource(Array())
    }
    
    init(target:UIViewController, data:Array<DBInteractionObject>) {
        self.target_ = target
        
        super.init()
        
        self.db_configureDataSource(data)
    }
    
    
// MARK: Private methods
    
    private func db_configureDataSource(_ data:Array<DBInteractionObject>) {
        self.items = data
    }
    
    
// MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let object = self.items![indexPath.row] as! DBInteractionObjectProtocol
        return object.tableView(tableView, cellForRowAt: indexPath)
    }
    
    
// MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let object = self.items![indexPath.row] as! DBInteractionObjectProtocol
        return object.cellSiseWithTableView(tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = self.items![indexPath.row] as! DBInteractionObjectProtocol
        object.target(self.target_, tableView: tableView, didSelectRowAt: indexPath)
    }
}
