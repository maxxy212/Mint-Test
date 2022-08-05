//
//  MintViewModelTest.swift
//  Mint TestTests
//
//  Created by Maxwell Nwanna on 05/08/2022.
//  Copyright © 2022 Maxwell. All rights reserved.
//

import XCTest
@testable import Mint_Test

class MintViewModelTest: XCTestCase {

    func testGetCommitMessages() {
        // 1
        let expectation = self.expectation(description: "commit")
        
        //2
        let viewModel = MintViewModel()
        
        //3
        viewModel.errMessage.bind { msg in
            if msg == "" {
                expectation.fulfill()
            }
        }
        
        //4
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            viewModel.getCommitMessages()
        }
        
        //5
        waitForExpectations(timeout: 8, handler: nil)
    }

}
