//
//  LoginResponseTest.swift
//  CoreAPI-iOSTests
//
//  Created by Mehran on 3/20/1401 AP.
//

import XCTest
@testable import CoreAPI_iOS

class LoginResponseTest: XCTestCase {
    
    var sut : LoginResponse!
    
    override func setUp() {
        super.setUp()
        sut = LoginResponse(token: "asdfghjkl")
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testLoginResponse_WhenDataProvided_ShouldBeCodable() {
        XCTAssertTrue(sut as Any is Decodable)
    }
    
    func testLoginResponse_WhenDataProvided_ShouldBeString() {
        XCTAssertTrue(sut?.token as Any is String)
    }
}
