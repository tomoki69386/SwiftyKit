//
//  Reusable.swift
//  SwiftyKit
//
//  Created by 築山朋紀 on 2019/12/19.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import UIKit

protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension UITableViewCell: Reusable { }
extension UITableViewHeaderFooterView: Reusable { }
extension UICollectionViewCell: Reusable { }

protocol TableComponent: RawRepresentable where Self.RawValue == Int {
    static var count: Int { get }
}
extension TableComponent where Self: CaseIterable {
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

protocol TableSection: TableComponent { }
extension TableSection {
    init(_ section: Int) {
        self.init(value: section)
    }
}
