//
//  DBInteractionObjectURL.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 04/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit
import SafariServices


class DBInteractionObjectURL: DBInteractionObject, DBInteractionObjectProtocol {

    private let objectURL_:String
    private let objectURLTitle_:String
    
    init(URL:String, title:String) {
        objectURL_ = URL
        objectURLTitle_ = title
    }
    
    
//MARK: DBInteractionObjectProtocol
    
    func cellSiseWithTableView(_ tableView: UITableView) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DBTableViewURLCell = tableView.dequeueReusableCell(withIdentifier: DBTableViewURLCell.db_cellIdentifier(), for: indexPath) as! DBTableViewURLCell
        cell.setCellText(self.objectURLTitle_)
        return cell
    }
    
    func target(_ target: Any, tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objectURL:URL = URL(string: objectURL_)!
        let vc = SFSafariViewController(url: objectURL, entersReaderIfAvailable: true)
        (target as! UIViewController).present(vc, animated: true, completion: nil)
    }
}
