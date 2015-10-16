//
//  Buildasaur_TesterTests.swift
//  Buildasaur-TesterTests
//
//  Created by Honza Dvorsky on 11/04/2015.
//  Copyright (c) 2015 Honza Dvorsky. All rights reserved.
//

import UIKit
import XCTest

public extension UIDevice {
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 where value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
}

class Buildasaur_TesterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
            NSThread.sleepForTimeInterval(0.01)
        }
    }
    
    func testFailOniPads() {
        let isIpad = UIDevice.currentDevice().userInterfaceIdiom == .Pad
        if isIpad {
            XCTFail("Not happening, brah")
        } else {
            XCTAssert(true)
        }
    }
    
    func testWorkEverywhere() {
        XCTAssert(true, "Pass")
    }
    
}
