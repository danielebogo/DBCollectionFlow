//
//  DBInteractionObjectImage.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 04/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit


class DBInteractionObjectImage: DBInteractionObject, DBInteractionObjectProtocol {
    
    private let itemImages_:[String]
    
    init(itemImages:[String]) {
        itemImages_ = itemImages
    }
    
    
//MARK: DBInteractionObjectProtocol
    
    func cellSiseWithTableView(_ target: Any, tableView: UITableView) -> CGFloat {
        return tableView.frame.width
    }
    
    func tableView(_ target: Any, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DBTableViewImageCell = tableView.dequeueReusableCell(withIdentifier: DBTableViewImageCell.db_cellIdentifier(), for: indexPath) as! DBTableViewImageCell
        cell.setCellImages(self.itemImages_)
        return cell
    }
}
