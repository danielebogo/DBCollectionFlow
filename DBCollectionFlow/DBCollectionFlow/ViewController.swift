//
//  ViewController.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 30/09/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var _dataFlow: DBTableViewDataFlow?
    private var _objects:Array<DBInteractionObject> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "Table View"
        
        weak var weakSelf = self
        
        let contentManager = DBContentManager()
        contentManager.loadItemsWithBlock { (items: Array<DBContentManager.Item>) in
            weakSelf?.db_createInteractionObjects(items: items)
        }
        
        _dataFlow = DBTableViewDataFlow(target: self, data: _objects)
        
        self.db_configureUI()
    }

    
// MARK: Private methods
    
    private func db_configureUI() {
        let nib = UINib(nibName:"DBTableViewTextCell", bundle: nil)

        self.tableView.register(nib, forCellReuseIdentifier: DBTableViewTextCell.db_cellIdentifier())
        
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension

        self.tableView.dataSource = _dataFlow
        self.tableView.delegate = _dataFlow
    }
    
    private func db_createInteractionObjects(items: Array<DBContentManager.Item>) {
        for item:DBContentManager.Item in items {
            
            switch item.itemType {
            case .Text:
                if let itemText = item.itemText {
                    _objects.append(DBInteractionObjectText.init(text: itemText))
                }
                break
                
            case .Image:
                
                break
            }
        }
    }
}

