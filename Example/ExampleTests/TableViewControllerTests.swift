//
//  TableViewControllerTests.swift
//  ExampleTests
//
//  Created by 築山朋紀 on 2019/12/20.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import XCTest
import SwiftyKit
@testable import Example

class TableViewControllerTests: XCTestCase {
    
    let viewController = TableViewController()
    
    func testThereTableView() {
        XCTAssertNotNil(viewController.tableView)
        XCTAssertFalse(viewController.tableView.isHidden)
    }
    
    func testTableViewSectionCount() {
        let sectionCount = viewController.numberOfSections(in: viewController.tableView)
        XCTAssertEqual(sectionCount, 3)
    }
    func testTableViewSectionFirstRowCount() {
        let rowCount = viewController.tableView(viewController.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, 2)
    }
    func testTableViewSectionSecondRowCount() {
        let rowCount = viewController.tableView(viewController.tableView, numberOfRowsInSection: 1)
        XCTAssertEqual(rowCount, 2)
    }
    func testTableViewSectionThaadRowCount() {
        let rowCount = viewController.tableView(viewController.tableView, numberOfRowsInSection: 2)
        XCTAssertEqual(rowCount, 2)
    }
    func testTableViewCellTextLabelSectionFirst() {
        let cell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? TableViewCell<CommonView>
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.backed.textLabel.text, "0: 0")
        XCTAssertEqual(cell?.backed.textLabel.textAlignment, .left)
    }
    func testTableViewCellTextLabelSectionSecond() {
        let cell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 1)) as? TableViewCell<CommonView>
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.backed.textLabel.text, "1: 0")
        XCTAssertEqual(cell?.backed.textLabel.textAlignment, .center)
    }
    func testTableViewCellTextLabelSectionThaad() {
        let cell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 2)) as? TableViewCell<CommonView>
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.backed.textLabel.text, "2: 0")
        XCTAssertEqual(cell?.backed.textLabel.textAlignment, .right)
    }
}
