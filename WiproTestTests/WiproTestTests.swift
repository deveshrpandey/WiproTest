//
//  WiproTestTests.swift
//  WiproTestTests
//
//  Created by Devesh  Pandey on 11/25/20.
//  Copyright © 2020 Wipro. All rights reserved.
//

import XCTest
@testable import WiproTest

class WiproTestTests: XCTestCase, CanadaInfoDataSource {
    

    var viewController: CanadaInfoViewController?
    var expectation: XCTestExpectation?
    var data = [CanadaInfoRow]()
    var errorInfo = String()
    
    
    override func setUpWithError() throws
    {
        viewController = CanadaInfoViewController()
        let _ = viewController?.loadViewIfNeeded()
        
    }

    override func tearDownWithError() throws {
        viewController?.canadaViewModel.delegate = nil
        viewController = nil
    }
    
    
    func testCanadaInfoDelegate()
    {
        let canadaMngr = CanadaViewModel()
        canadaMngr.delegate = self
        
        /// Act
        expectation = expectation(description: "CanadaInfoData updates") // 3
        canadaMngr.getDataFromAPI()
        /// Assert
        waitForExpectations(timeout: 10) // 4
        
        do {
            let result = try XCTUnwrap(data)
            XCTAssertEqual(result.count, 14)
        } catch  {
            print(error.localizedDescription)
        }
       
    }
    
    func testPullToRefresh()
     {
        let _ = viewController?.loadViewIfNeeded()
        viewController?.refreshControl.sendActions(for: .valueChanged)
        XCTAssert(((viewController?.refreshControl.attributedTitle) != nil))
      }
    
    func getCanadaInfoData(data: [CanadaInfoRow], title: String) {
        if expectation != nil {
            self.data = data
        }
        expectation?.fulfill()
        expectation = nil
    }
    
    func dataErrorInfo(errorInfo: String) {
        //dataError
        if expectation != nil {
            self.errorInfo = errorInfo
        }
        expectation?.fulfill()
        expectation = nil
    }
    
   
}
