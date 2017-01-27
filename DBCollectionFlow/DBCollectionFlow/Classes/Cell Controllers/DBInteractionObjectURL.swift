//
//  DBInteractionObjectURL.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 04/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit
import SafariServices


class DBInteractionObjectURL: DBInteractionObject, DBInteractionObjectSelectionProtocol {

    private let _objectURL:String
    private let _objectURLTitle:String
    
    init(URL:String, title:String) {
        self._objectURL = URL
        self._objectURLTitle = title
    }
    
    
//MARK: DBInteractionObjectProtocol
    
    func cellSiseWithTableView(_ tableView: UITableView, target: AnyObject) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, target: AnyObject) -> UITableViewCell {
        let cell: DBTableViewURLCell = tableView.dequeueReusableCell(withIdentifier: DBTableViewURLCell.db_cellIdentifier, for: indexPath) as! DBTableViewURLCell
        cell.setCellText(self._objectURLTitle)
        return cell
    }

    func target(_ target: AnyObject, tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objectURL:URL = URL(string: self._objectURL)!
        let vc = SFSafariViewController(url: objectURL, entersReaderIfAvailable: true)
        (target as! UIViewController).present(vc, animated: true, completion: nil)
    }
}
