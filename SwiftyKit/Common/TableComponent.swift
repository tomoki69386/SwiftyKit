//
//  TableComponent.swift
//  SwiftyKit
//
//  Created by tomoki_sun on 2019/12/20.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import Foundation

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
