//
//  ListViewController.swift
//  DBCollectionFlow
//
//  Created by Daniele Bogo on 05/10/2016.
//  Copyright © 2016 Daniele Bogo. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak private var tableView: DBTableView!
    
    private var dataFlow_: DBTableViewDataFlow?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.db_configureDataSource()
    }


//MARK: Private methods
    
    private func db_configureDataSource() {
        let textItems: Array<String> = [ "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                         "Suspendisse tristique eros sed augue varius, id egestas eros interdum.",
                                         "Nulla facilisi.",
                                         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae velit neque. Sed vehicula vestibulum urna, et facilisis neque viverra a. Etiam eget bibendum tellus, eget scelerisque sapien. Pellentesque lorem lectus, pellentesque a efficitur nec, auctor a nisl. Nulla sit amet diam eget arcu sagittis aliquet ac et magna. Mauris faucibus commodo ullamcorper. Donec imperdiet, mauris in volutpat pretium, ante purus suscipit sapien, at ultricies nisl magna vel eros. Praesent in faucibus lectus." ]
        var i = 0
        
        var items: Array<DBInteractionObjectText> = Array()
        
        let count = 4
        
        repeat {
        
            let a = i%count
            
            var text:String
            
            if a-1 >= 0 {
                text = textItems[a] + " " + textItems[a-1]
            } else {
                text = textItems[a]
            }
            
            items.append(DBInteractionObjectText.init(text: text))
            
            i += 1
        } while (i < (count * 2))
        
        dataFlow_ = DBTableViewDataFlow.init(target: self, data: items)
        
        self.tableView.dataSource = dataFlow_
        self.tableView.delegate = dataFlow_
    }
}
