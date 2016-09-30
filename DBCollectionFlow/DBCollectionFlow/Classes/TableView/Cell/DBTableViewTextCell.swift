//
//  DBTableViewTextCell.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 30/09/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit

class DBTableViewTextCell: UITableViewCell {

    @IBOutlet weak var cellTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func setCellText(_ text:String) {
        self.cellTextLabel.text = text
    }
    
}
