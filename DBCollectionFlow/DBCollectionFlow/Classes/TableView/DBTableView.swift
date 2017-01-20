//
//  DBTableView.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 04/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit


class DBTableView: UITableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.db_configureUI()
    }

    
//MARK: Private methods
    
    private func db_configureUI() {
        let textCellNib = UINib(nibName:"DBTableViewTextCell", bundle: nil)
        let imageCellNib = UINib(nibName:"DBTableViewImageCell", bundle: nil)
        let urlCellNib = UINib(nibName:"DBTableViewURLCell", bundle: nil)
        
        self.register(textCellNib, forCellReuseIdentifier: DBTableViewTextCell.db_cellIdentifier)
        self.register(imageCellNib, forCellReuseIdentifier: DBTableViewImageCell.db_cellIdentifier)
        self.register(urlCellNib, forCellReuseIdentifier: DBTableViewURLCell.db_cellIdentifier)
        
        self.estimatedRowHeight = 44.0
        self.rowHeight = UITableViewAutomaticDimension
    }
}
