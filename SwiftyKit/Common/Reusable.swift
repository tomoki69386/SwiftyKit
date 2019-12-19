//
//  Reusable.swift
//  SwiftyKit
//
//  Created by tomoki_sun on 2019/12/19.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import UIKit

public protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension UITableViewCell: Reusable { }
extension UITableViewHeaderFooterView: Reusable { }
extension UICollectionViewCell: Reusable { }
