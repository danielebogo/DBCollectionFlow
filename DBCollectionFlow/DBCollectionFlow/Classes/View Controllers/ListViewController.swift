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
    
    private var _dataFlow: DBTableViewDataFlow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let contentManager = DBContentManager()
        contentManager.loadTextItemsWithBlock { [weak self] (response: DBDataAccessObjectResponse) in
            switch response {
            case .success(let items):
                self?.db_createInteractionObjects(items: items)
                break
                
            case .error(let error):
                print("Error: \(error.errorMessage)")
            }
        }
    }


//MARK: Private methods
    
    private func db_createInteractionObjects(items: [DBInteractionObject]) {
        self._dataFlow = DBTableViewDataFlow(target: self, data: items)
        
        self.tableView.dataSource = self._dataFlow
        self.tableView.delegate = self._dataFlow

    }
}
