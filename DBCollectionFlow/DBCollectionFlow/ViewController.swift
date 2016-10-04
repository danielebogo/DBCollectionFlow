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
    private var objects_:Array<DBInteractionObject> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "Table View"
        
        self.db_configureUI()
        
        weak var weakSelf = self
        
        let contentManager = DBContentManager()
        contentManager.loadItemsWithBlock { (items: Array<DBContentManager.Item>) in
            weakSelf?.db_createInteractionObjects(items: items)
        }
    }

    
// MARK: Private methods
    
    private func db_configureUI() {
        self.dataFlow_ = DBTableViewDataFlow(target: self, data: self.objects_)
        
        self.tableView.dataSource = self.dataFlow_
        self.tableView.delegate = self.dataFlow_
    }
    
    private func db_createInteractionObjects(items: Array<DBContentManager.Item>) {
        for item:DBContentManager.Item in items {
            
            switch item.itemType {
                case .Text:
                    if let itemText = item.itemText {
                        self.objects_.append(DBInteractionObjectText.init(text: itemText))
                    }
                    break
                    
                case .Image:
                    if let itemImageName = item.itemImage {
                        self.objects_.append(DBInteractionObjectImage.init(imageName: itemImageName))
                    }
                    
                    break
                    
                case .URL:
                    if let itemURL = item.itemURL, let itemURLTitle = item.itemURLTitle {
                        self.objects_.append(DBInteractionObjectURL(URL: itemURL, title: itemURLTitle))
                    }
                    break
            }
        }
        
        self.dataFlow_?.items = self.objects_
        self.tableView.reloadData()
    }
}

