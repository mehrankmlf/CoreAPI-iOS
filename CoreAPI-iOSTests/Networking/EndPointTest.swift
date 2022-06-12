//
//  EndPointTest.swift
//  CoreAPI-iOSTests
//
//  Created by Mehran on 3/21/1401 AP.
//

import XCTest

@testable import CoreAPI_iOS

class EndPointTest: XCTestCase {
    
    var endPoint : TargetType!
    
    override func setUp() {
        super.setUp()
        endPoint = MockEndPoint()
    }
    
    override func tearDown() {
        endPoint = nil
        super.tearDown()
    }
    
    func testTargetType_WhenBaseURl_ShouldReturnString() {
        XCTAssertTrue(endPoint.baseURL as Any is String)
    }
    
    func testTargetType_WhenBaseURl_ShouldReturnURL() {
        XCTAssertEqual(endPoint.baseURL, "www.testUrl.com")
    }
    
    func testTargetType_WhenVersion_ShouldReturnString() {
        XCTAssertTrue(endPoint.version as Any is String)
    }
    
    func testTargetType_WhenVersion_ShouldReturnVersion() {
        XCTAssertEqual(endPoint.version, "v1")
    }
    
    func testTargetType_WhenPath_ShouldBeRequestType() {
        XCTAssertTrue(endPoint.path as Any is RequestType)
    }
    
    func testTargetType_WhenPath_ShouldReturnPath() {
        let endPoint = endPoint
        XCTAssertEqual(endPoint?.path, .requestPath(path: "test"))
    }

    func testTargetType_WhenMethod_ShouldReturnPost() {
        let endPoint = endPoint
        XCTAssertEqual(endPoint?.method, .post)
    }
    
    func testTargetType_WhenHeader_ShouldReturnDict() {
        XCTAssertEqual(endPoint.headers, ["header": "header"])
    }
}
