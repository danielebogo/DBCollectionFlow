//
//  DBInteractionObjectText.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 03/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit


class DBInteractionObjectText: DBInteractionObject, DBInteractionObjectProtocol {
    
    private let objectText_:String
    
    init(text:String) {
        objectText_ = text
    }
    
    
//MARK: DBInteractionObjectProtocol
    
    func cellSiseWithTableView(_ target: Any, tableView: UITableView) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ target: Any, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DBTableViewTextCell = tableView.dequeueReusableCell(withIdentifier: DBTableViewTextCell.db_cellIdentifier(), for: indexPath) as! DBTableViewTextCell
        cell.setCellText(self.objectText_)
        return cell
    }
    
    func target(_ target: Any, tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
