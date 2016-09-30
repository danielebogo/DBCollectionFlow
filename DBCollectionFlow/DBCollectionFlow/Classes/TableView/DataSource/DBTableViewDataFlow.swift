//
//  DBTableViewDataSource.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 30/09/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit

class DBTableViewDataFlow: NSObject, UITableViewDelegate, UITableViewDataSource  {
    
    private let target: UIViewController
    
    var items: [String]?
    
    init(target:UIViewController) {
        self.target = target
        
        super.init()
        
        self.db_configureDataSource()
    }
    
    
// MARK: Private methods
    
    func db_configureDataSource() {
        self.items = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac justo eu turpis maximus sollicitudin eget quis massa. Sed ac convallis enim. In ac turpis non lectus ullamcorper efficitur.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac justo eu turpis maximus sollicitudin eget quis massa.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit."]
    }
    
    
// MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DBTableViewTextCell = tableView.dequeueReusableCell(withIdentifier: DBTableViewTextCell.db_cellIdentifier(), for: indexPath) as! DBTableViewTextCell
        cell.setCellText(self.items![indexPath.row])
        return cell
    }
}
