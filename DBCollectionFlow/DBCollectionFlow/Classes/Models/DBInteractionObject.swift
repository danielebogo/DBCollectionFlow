//
//  DBInteractionObject.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 03/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit

protocol DBInteractionObjectProtocol {
    func cellSiseWithTableView(_ tableView: UITableView) -> CGFloat
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func target(_ target:Any, tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}


class DBInteractionObject: NSObject {

}
