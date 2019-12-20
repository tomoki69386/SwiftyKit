//
//  TableViewController.swift
//  Example
//
//  Created by 築山朋紀 on 2019/12/20.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import UIKit
import SwiftyKit

final class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(cellClass: TableViewCell.self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(of: TableViewCell.self, for: indexPath)
    }
}
