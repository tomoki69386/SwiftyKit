//
//  ReusableTests.swift
//  SwiftyKitTests
//
//  Created by tomoki_sun on 2019/12/20.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import XCTest
@testable import SwiftyKit

class ReusableTests: XCTestCase {

    func testCommonTableViewCellReuseIdentifier() {
        
        class CommonCell: UITableViewCell { }
        
        XCTAssertEqual(CommonCell.reuseIdentifier, NSStringFromClass(CommonCell.self))
    }
    
    func testCommonCollectionViewCellReuseIdentifier() {
        
        class CommonCell: UICollectionViewCell { }
        
        XCTAssertEqual(CommonCell.reuseIdentifier, NSStringFromClass(CommonCell.self))
    }
    
    func testCommonTableViewHeaderFooterViewReuseIdentifier() {
        
        class CommonView: UITableViewHeaderFooterView { }
        
        XCTAssertEqual(CommonView.reuseIdentifier, NSStringFromClass(CommonView.self))
    }
}
