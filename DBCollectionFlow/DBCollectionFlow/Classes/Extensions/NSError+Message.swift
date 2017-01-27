//
//  NSError+Message.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 07/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit


extension NSError {
    var errorMessage:String {
        switch self.code {
        case 404:
            return "Invalid filename/path."
        case 406:
            return "Could not get json from file, make sure that file contains valid json."
        default:
            return self.localizedDescription
        }
    }
}
