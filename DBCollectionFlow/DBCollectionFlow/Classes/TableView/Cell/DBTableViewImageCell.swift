//
//  DBTableViewImageCell.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 04/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit

class DBTableViewImageCell: UITableViewCell {

    @IBOutlet weak private var cellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.db_buildUI()
    }
    
    
//MARK: Public methods
    
    public func setCellImage(_ image:UIImage) {
        self.cellImageView.image = image
    }
    
    
//MARK: Private methods
    
    private func db_buildUI() {
        self.selectionStyle = .none
    }

}
