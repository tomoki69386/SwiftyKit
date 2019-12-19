//
//  SwiftyKitTests.swift
//  SwiftyKitTests
//
//  Created by tomoki_sun on 2019/12/19.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import XCTest
@testable import SwiftyKit

private final class CommonCell: UITableViewCell { }

class SwiftyKitTests: XCTestCase {
    func testCommonCellReuseIdentifier() {
        XCTFail(CommonCell.reuseIdentifier)
    }
}
