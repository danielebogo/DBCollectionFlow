//
//  DBInteractionObjectText.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 03/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit


class DBInteractionObjectText: DBInteractionObject, DBInteractionObjectProtocol {
    
    let objectText:String
    
    init(text:String) {
        objectText = text
    }
    
    
//MARK: DBInteractionObjectProtocol
    
    func cellSise() -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DBTableViewTextCell = tableView.dequeueReusableCell(withIdentifier: DBTableViewTextCell.db_cellIdentifier(), for: indexPath) as! DBTableViewTextCell
        cell.cellTextLabel.text = self.objectText
        return cell
    }
}
