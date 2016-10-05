//
//  DBTableViewURLCell.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 04/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit


class DBTableViewURLCell: UITableViewCell {

    @IBOutlet weak private var cellLabelText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.db_buildUI()
    }
    
    
//MARK: Public methods
    
    public func setCellText(_ text:String) {
        self.cellLabelText.text = text
    }
    
    
//MARK: Private methods
    
    private func db_buildUI() {
        self.selectionStyle = .none
    }
}
