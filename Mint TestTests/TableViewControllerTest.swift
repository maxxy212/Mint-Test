//
//  TableViewControllerTest.swift
//  Mint TestTests
//
//  Created by Maxwell Nwanna on 05/08/2022.
//  Copyright © 2022 Maxwell. All rights reserved.
//

import XCTest
@testable import Mint_Test

class TableViewControllerTest: XCTestCase {
    
    var sut: TableViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? TableViewController
        _ = sut.view
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testTableViewPresent() throws {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testDataSourcePresent() throws {
        XCTAssertNotNil(sut.tableView.dataSource.self)
    }
    
    func testNumberOfSectionisOne() throws {
        let numberSect = sut.tableView.numberOfSections
        
        XCTAssertEqual(1, numberSect)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
