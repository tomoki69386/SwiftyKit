//
//  UITableView+Extension.swift
//  SwiftyKit
//
//  Created by tomoki_sun on 2019/12/19.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import UIKit

public extension UITableView {
    /// Registers a class for use in creating new table cells.
    func register<Cell: UITableViewCell>(cellClass: Cell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }

    /// Registers a nib class for use in creating new table cells.
    func register<Cell: UITableViewCell>(nibClass: Cell.Type) {
        register(nibClass.nib, forCellReuseIdentifier: nibClass.reuseIdentifier)
    }

    func dequeueReusableCell<Cell: UITableViewCell>(of cellClass: Cell.Type, for indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier, for: indexPath) as? Cell else {
            assertionFailure("\(Cell.self) が登録されていません")
            return cellClass.init(style: .default, reuseIdentifier: cellClass.reuseIdentifier)
        }
        return cell
    }
}
