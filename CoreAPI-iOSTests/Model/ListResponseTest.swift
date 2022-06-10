//
//  ListResponseTest.swift
//  CoreAPI-iOSTests
//
//  Created by Mehran on 3/20/1401 AP.
//

import XCTest
@testable import CoreAPI_iOS

class ListResponseTest: XCTestCase {
    
    var sut : UsersListResponse!

    override func setUp()  {
        super.setUp()
        sut = UsersListResponse(id: 1, email: "test@test.com", firstName: "testname", lastName: "testfamily")
    }
    
    override func tearDown()  {
        sut = nil
        super.tearDown()
    }
    
    func testListResposne_WhenDataProvided_ShouldBeCodable() {
        XCTAssertTrue(sut as Any is Decodable)
    }
    
    func testListResponse_WhenDataProvided_ShouldBeString() {
        XCTAssertTrue(sut?.id == 1)
        XCTAssertTrue(sut?.email ==  "test@test.com")
        XCTAssertTrue(sut?.firstName == "testname")
        XCTAssertTrue(sut?.lastName == "testfamily")
    }
}
