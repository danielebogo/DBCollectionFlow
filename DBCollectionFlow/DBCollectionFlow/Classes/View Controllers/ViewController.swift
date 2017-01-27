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
    
    private var _dataFlow: DBTableViewDataFlow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.db_configureUI()
        
        let contentManager = DBContentManager()
        contentManager.loadItemsWithBlock { [weak self] (response: DBDataAccessObjectResponse) in
            switch response {
            case .success(let items):
                self?.db_createInteractionObjects(items: items)
                break
                
            case .error(let error):
                print("Error: \(error.errorMessage)")
            }
        }
    }

    
// MARK: Private methods
    
    private func db_configureUI() {
        self._dataFlow = DBTableViewDataFlow(target: self)
        
        self.tableView.dataSource = self._dataFlow
        self.tableView.delegate = self._dataFlow
    }
    
    private func db_createInteractionObjects(items: [DBInteractionObject]) {
        self._dataFlow?.items = items
        self.tableView.reloadData()
    }
}
