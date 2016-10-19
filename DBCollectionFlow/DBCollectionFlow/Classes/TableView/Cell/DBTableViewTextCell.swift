//
//  DBTableViewTextCell.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 30/09/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit


class DBTableViewTextCell: UITableViewCell {

    @IBOutlet weak private var cellTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.db_buildUI()
    }

    
//MARK: Public methods
    
    func setCellText(_ text:String) {
        self.cellTextLabel.text = text
    }
    
    
//MARK: Private methods
    
    private func db_buildUI() {
        self.selectionStyle = .none
        
//        self.cellTextLabel.font = UIFont.db_blockFontWithSize(15.0)
        self.cellTextLabel.textColor = UIColor.lightGray
    }
}
