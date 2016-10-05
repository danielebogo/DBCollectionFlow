//
//  ViewController.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 30/09/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: DBTableView!
    
    private var dataFlow_: DBTableViewDataFlow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.db_configureUI()
        
        weak var weakSelf = self
        
        let contentManager = DBContentManager()
        contentManager.loadItemsWithBlock { (items: Array<DBInteractionObject>) in
            weakSelf?.db_createInteractionObjects(items: items)
        }
    }

    
// MARK: Private methods
    
    private func db_configureUI() {
        self.dataFlow_ = DBTableViewDataFlow(target: self)
        
        self.tableView.dataSource = self.dataFlow_
        self.tableView.delegate = self.dataFlow_
    }
    
    private func db_createInteractionObjects(items: Array<DBInteractionObject>) {
        self.dataFlow_?.items = items
        self.tableView.reloadData()
    }
}

