//
//  DBInteractionObject.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 03/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit


protocol DBInteractionObjectProtocol {
    func cellSiseWithTableView(_ tableView: UITableView, target:AnyObject) -> CGFloat
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, target:AnyObject) -> UITableViewCell
}

protocol DBInteractionObjectSelectionProtocol:DBInteractionObjectProtocol {
    func target(_ target:AnyObject, tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}


class DBInteractionObject: NSObject {
    var editableState:Bool = false
}

enum DBInteractionObjectType {
    case text(text:String?)
    case image(images:[String]?)
    case url(url:String?, title:String?)
    
    init(with data:[String:AnyObject]) {
        let item:Item = Item(data: data)
        
        switch item.itemType {
        case .text:
            self = .text(text: item.itemText)
        case .image:
            self = .image(images: item.itemImages)
        case .url:
            self = .url(url: item.itemURL, title: item.itemURLTitle)
        }
    }
    
    var interactionObject:DBInteractionObject {
        switch self {
        case .text(let text):
            return DBInteractionObjectText(text: text ?? "")
        case .image(let images):
            return DBInteractionObjectImage(itemImages: images ?? [])
        case .url(let url, let title):
            return DBInteractionObjectURL(URL: url ?? "", title: title ?? "")
        }
    }
}
