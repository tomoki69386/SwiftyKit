//
//  TableComponentTests.swift
//  SwiftyKitTests
//
//  Created by tomoki_sun on 2019/12/20.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import XCTest
@testable import SwiftyKit

class TableComponentTests: XCTestCase {
    
    func testEnumTableSection() {
        enum Color: Int, CaseIterable, TableSection {
            case red, blue, green, yellow
        }
        
        XCTAssertEqual(Color.count, 4)
        XCTAssertEqual(Color(0), Color.red)
        XCTAssertEqual(Color(1), Color.blue)
        XCTAssertEqual(Color(2), Color.green)
        XCTAssertEqual(Color(3), Color.yellow)
    }
}
