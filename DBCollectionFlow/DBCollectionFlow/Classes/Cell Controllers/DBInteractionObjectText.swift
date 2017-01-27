//
//  DBInteractionObjectText.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 03/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit


class DBInteractionObjectText: DBInteractionObject, DBInteractionObjectProtocol {
    
    private let _objectText:String
    
    init(text:String) {
        self._objectText = text
    }
    
    
//MARK: DBInteractionObjectProtocol
    
    func cellSiseWithTableView(_ tableView: UITableView, target: AnyObject) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, target: AnyObject) -> UITableViewCell {
        let cell: DBTableViewTextCell = tableView.dequeueReusableCell(withIdentifier: DBTableViewTextCell.db_cellIdentifier, for: indexPath) as! DBTableViewTextCell
        cell.setCellText(self._objectText)
        return cell
    }
}
