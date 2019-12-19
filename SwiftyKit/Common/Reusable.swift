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

public protocol TableComponent: RawRepresentable where Self.RawValue == Int {
    static var count: Int { get }
}
public extension TableComponent where Self: CaseIterable {
    @inlinable
    static var count: Int {
        return self.allCases.count
    }
}
private extension TableComponent {
    init(value: Int) {
        let component = Self.init(rawValue: value) ?? {
            return Self.init(rawValue: 0)!
        }()
        self = component
    }
}

public protocol TableSection: TableComponent { }
public extension TableSection {
    init(_ section: Int) {
        self.init(value: section)
    }
}
