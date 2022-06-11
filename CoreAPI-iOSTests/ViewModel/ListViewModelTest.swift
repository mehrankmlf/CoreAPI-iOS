//
//  ListViewModelTest.swift
//  CoreAPI-iOSTests
//
//  Created by Mehran on 3/20/1401 AP.
//

import XCTest
import Combine

@testable import CoreAPI_iOS

class ListViewModelTest<T: Decodable> : XCTestCase {
    
    var subject: T!
    var mockListService : MockListService!
    var viewModelToTest : ListViewModel!
    private var bag : Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()
        subject = UsersListResponse(id: 1, email: "mail@mail.com", firstName: "firstname", lastName: "familyname") as? T
        mockListService = MockListService()
        viewModelToTest = ListViewModel()
    }
    
    override func tearDown() {
        mockListService = nil
        viewModelToTest = nil
        super.tearDown()
    }
    
    func testListSevice_WhenServiceCalled_ShouldReturnResponse() {

        let expectation = XCTestExpectation(description: "State is set to Token")
        
        viewModelToTest.loadinState.dropFirst().sink { event in
            XCTAssertEqual(event, .loadStart)
              expectation.fulfill()
        }.store(in: &bag)
        
        mockListService.fetchedListResult = Result.success(subject as? BaseResponse<[UsersListResponse]>).publisher.eraseToAnyPublisher()
        viewModelToTest.callUserListServie()
        
        wait(for: [expectation], timeout: 1)
    }
}
