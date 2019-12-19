//
//  UIBarButtonItemTests.swift
//  SwiftyKitTests
//
//  Created by 築山朋紀 on 2019/12/20.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import XCTest
@testable import SwiftyKit

class UIBarButtonItemTests: XCTestCase {
    func testBackBarButtonEmptyTitle() {
        let backBarButtonItem = UIBarButtonItem.createBackBarButtonItemForEmptyTitle()
        
        XCTAssertEqual(backBarButtonItem.title, " ")
    }
}
