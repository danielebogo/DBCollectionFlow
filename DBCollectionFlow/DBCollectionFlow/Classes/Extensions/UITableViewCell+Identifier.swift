//
//  UITableViewCell+Identifier.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 30/09/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit

extension UITableViewCell {
    public static func db_cellIdentifier() -> String {
        return "k\(NSStringFromClass(self))Identifier"
    }
}
