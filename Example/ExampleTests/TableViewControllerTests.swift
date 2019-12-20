//
//  TableViewControllerTests.swift
//  ExampleTests
//
//  Created by 築山朋紀 on 2019/12/20.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import XCTest
@testable import Example

class TableViewControllerTests: XCTestCase {
    
    let viewController = TableViewController()
    
    func testThereTableView() {
        XCTAssertNotNil(viewController.tableView)
        XCTAssertFalse(viewController.tableView.isHidden)
    }
    
    func testTableViewSectionCount() {
        let sectionCount = viewController.numberOfSections(in: viewController.tableView)
        XCTAssertEqual(sectionCount, 2)
    }
    
    func testTableViewSectionOneRowCount() {
        let rowCount = viewController.tableView(viewController.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, 5)
    }
    
    func testTableViewSectionTwoRowCount() {
        let rowCount = viewController.tableView(viewController.tableView, numberOfRowsInSection: 1)
        XCTAssertEqual(rowCount, 5)
    }
    
    func testTableViewCellNotNil() {
        let nibCell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? NibTableViewCell
        XCTAssertNotNil(nibCell)
        
        let codeCell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 1)) as? TableViewCell
        XCTAssertNotNil(codeCell)
    }
}
