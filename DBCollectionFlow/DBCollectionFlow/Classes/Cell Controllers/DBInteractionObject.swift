//
//  DBInteractionObject.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 03/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit


protocol DBInteractionObjectProtocol {
    func cellSiseWithTableView(_ target:Any, tableView: UITableView) -> CGFloat
    func tableView(_ target:Any, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

protocol DBInteractionObjectSelectionProtocol:DBInteractionObjectProtocol {
    func target(_ target:Any, tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}


class DBInteractionObject: NSObject {
    var editableState:Bool = false
}
