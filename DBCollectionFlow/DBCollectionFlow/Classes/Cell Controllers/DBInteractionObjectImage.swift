//
//  DBInteractionObjectImage.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 04/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit


class DBInteractionObjectImage: DBInteractionObject, DBInteractionObjectProtocol {
    
    private let _itemImages:[String]
    
    init(itemImages:[String]) {
        self._itemImages = itemImages
    }
    
    
//MARK: DBInteractionObjectProtocol
    
    func cellSiseWithTableView(_ tableView: UITableView, target: AnyObject) -> CGFloat {
        return tableView.frame.width
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, target: AnyObject) -> UITableViewCell {
        let cell: DBTableViewImageCell = tableView.dequeueReusableCell(withIdentifier: DBTableViewImageCell.db_cellIdentifier, for: indexPath) as! DBTableViewImageCell
        cell.setCellImages(self._itemImages)
        return cell
    }
}
