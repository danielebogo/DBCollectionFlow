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
    
    private var dataFlow: DBTableViewDataFlow?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.dataFlow = DBTableViewDataFlow(target: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "Table View"
        
        self.db_configureUI()
    }

    
// MARK: Private methods
    
    private func db_configureUI() {
        let nib = UINib(nibName:"DBTableViewTextCell", bundle: nil)

        self.tableView.register(nib, forCellReuseIdentifier: DBTableViewTextCell.db_cellIdentifier())
        
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension

        self.tableView.dataSource = self.dataFlow
        self.tableView.delegate = self.dataFlow
    }
}

