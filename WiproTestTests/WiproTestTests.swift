//
//  WiproTestTests.swift
//  WiproTestTests
//
//  Created by Devesh  Pandey on 11/25/20.
//  Copyright © 2020 Wipro. All rights reserved.
//

import XCTest
@testable import WiproTest

class WiproTestTests: XCTestCase {
    
    var viewController: CanadaInfoViewController?
    
    override func setUpWithError() throws
    {
        viewController = CanadaInfoViewController()
        let _ = viewController?.loadViewIfNeeded()
        
    }

    override func tearDownWithError() throws {
        viewController = nil
    }
    
    
    func testCanadaInfoDelegate()
    {
        let mockDelegate = MockCanadaInfoDelegate(testCase: self)
        
        let canadaMngr = CanadaViewModel()
        canadaMngr.delegate = mockDelegate
        
        /// Act
        mockDelegate.expectCanadaData()
        canadaMngr.getDataFromAPI()
        /// Assert
        waitForExpectations(timeout: 10)
        
        do {
            let result = try XCTUnwrap(mockDelegate.data)
            XCTAssertEqual(result.count, 14)
        }
        catch  {
            print(error.localizedDescription)
        }
       
    }
    
    func testPullToRefresh()
     {
        let _ = viewController?.loadViewIfNeeded()
        viewController?.refreshControl.sendActions(for: .valueChanged)
        XCTAssert(((viewController?.refreshControl.attributedTitle) != nil))
      }
    
   
}
