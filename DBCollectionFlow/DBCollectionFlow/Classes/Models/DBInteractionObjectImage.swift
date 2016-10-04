//
//  DBInteractionObjectImage.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 04/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit

class DBInteractionObjectImage: DBInteractionObject, DBInteractionObjectProtocol {
    private let imageViewName:String
    
    init(imageName:String) {
        imageViewName = imageName
    }
    
    
//MARK: DBInteractionObjectProtocol
    
    func cellSiseWithTableView(_ tableView: UITableView) -> CGFloat {
        return tableView.frame.width
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DBTableViewImageCell = tableView.dequeueReusableCell(withIdentifier: DBTableViewImageCell.db_cellIdentifier(), for: indexPath) as! DBTableViewImageCell
        cell.setCellImage(UIImage(named: self.imageViewName)!)
        return cell
    }
    
    func target(_ target: Any, tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
