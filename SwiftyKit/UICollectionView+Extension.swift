//
//  UICollectionView+Extension.swift
//  SwiftyKit
//
//  Created by 築山朋紀 on 2019/12/19.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    /// Register a class for use in creating new collection view cells.
    func register<Cell: UICollectionViewCell>(cellClass: Cell.Type) {
        register(cellClass, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
    }
    
    /// Register a nib class for use in creating new collection view cells.
    func register<Cell: UICollectionViewCell>(nibClass: Cell.Type) {
        register(nibClass.nib, forCellWithReuseIdentifier: nibClass.reuseIdentifier)
    }
    
    func dequeueReusableCell<Cell: UICollectionViewCell>(of cellClass: Cell.Type, for indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellClass.reuseIdentifier, for: indexPath) as? Cell else {
            assertionFailure("\(Cell.self)は登録されていません")
            return cellClass.init()
        }
        return cell
    }
}
