//
//  DBInteractionObject.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 03/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit

protocol DBInteractionObjectProtocol {
    func cellSise() -> CGFloat
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}


class DBInteractionObject: NSObject {
    
}
