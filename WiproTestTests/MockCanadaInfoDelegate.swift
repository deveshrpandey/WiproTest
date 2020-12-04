//
//  MockCanadaInfoDelegate.swift
//  WiproTestTests
//
//  Created by Devesh  Pandey on 12/2/20.
//  Copyright © 2020 Wipro. All rights reserved.
//

import XCTest

@testable import WiproTest

class MockCanadaInfoDelegate: CanadaInfoDataSource
{
    var expectation: XCTestExpectation?
    var data = [CanadaInfoRow]()
    private var testCase: XCTestCase
    
    init(testCase:XCTestCase) {
        self.testCase = testCase
    }
    func expectCanadaData() {
        expectation = testCase.expectation(description: "Expect Canada Data")
    }
    
/// Delegate Method---
    func getCanadaInfoData(data: [CanadaInfoRow], title: String) {
        if expectation != nil {
            self.data = data
        }
        expectation?.fulfill()
        expectation = nil
    }
    
    func dataErrorInfo(errorInfo: String) {
        ///dataError
        if expectation != nil {
            print(errorInfo)
        }
        expectation?.fulfill()
        expectation = nil
    }
    
    
}
