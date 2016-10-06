//
//  ListViewController.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 05/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit


class ListViewController: UIViewController {

    @IBOutlet weak private var tableView: DBTableView!
    
    private var dataFlow_: DBTableViewDataFlow?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        weak var weakSelf = self
        
        let contentManager = DBContentManager()
        contentManager.loadTextItemsWithBlock { (items: [DBInteractionObject]) in
            weakSelf?.db_createInteractionObjects(items: items)
        }
    }


//MARK: Private methods
    
    private func db_createInteractionObjects(items: [DBInteractionObject]) {
        self.dataFlow_ = DBTableViewDataFlow(target: self, data: items)
        
        self.tableView.dataSource = self.dataFlow_
        self.tableView.delegate = self.dataFlow_

    }
}
