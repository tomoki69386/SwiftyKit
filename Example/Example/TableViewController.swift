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
        self.tableView.register(nibClass: NibTableViewCell.self)
    }
    
    enum Section: Int, CaseIterable, TableSection {
        case nib, code
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section(indexPath.section) {
        case .nib:
            return tableView.dequeueReusableCell(of: NibTableViewCell.self, for: indexPath)
        case .code:
            let cell = tableView.dequeueReusableCell(of: TableViewCell.self, for: indexPath)
            cell.textLabel?.text = "\(indexPath.section): \(indexPath.row)"
            return cell
        }
    }
}
