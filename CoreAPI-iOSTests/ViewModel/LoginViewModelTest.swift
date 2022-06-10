//
//  LoginViewModelTest.swift
//  CoreAPI-iOSTests
//
//  Created by Mehran on 3/20/1401 AP.
//

import XCTest
import Combine

@testable import CoreAPI_iOS

class LoginViewModelTest: XCTestCase {
    
    var mockLoginService : MockLoginService!
    var viewModelToTest : loginViewModel!
    private var bag : Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()
        mockLoginService = MockLoginService()
        viewModelToTest = LoginViewModel(getTokenData: mockLoginService)
    }

    override func tearDown() {
        mockLoginService = nil
        viewModelToTest = nil
        super.tearDown()
    }
    
    func testLoginSevice_WhenServiceCalled_ShouldReturnResponse() {
        
        let tokenData = LoginResponse(token: "asdfghjkl")
        
        let expectation = XCTestExpectation(description: "State is set to Token")
        
        viewModelToTest.loadinState.dropFirst().sink { event in
            XCTAssertEqual(event, .loadStart)
              expectation.fulfill()
        }.store(in: &bag)
        
        mockLoginService.fetchedTokenResult = Result.success(tokenData).publisher.eraseToAnyPublisher()
        viewModelToTest.callLoginService(email: "", password: "")
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testLoginService_WhenServiceCalled_ShouldReturnNil() {
        let tokenData = LoginResponse()
        
        let expectation = XCTestExpectation(description: "State is set to Token")
        
        viewModelToTest.loadinState.dropFirst().sink { event in
            XCTAssertEqual(event, .loadStart)
              expectation.fulfill()
        }.store(in: &bag)
        
        mockLoginService.fetchedTokenResult = Result.success(tokenData).publisher.eraseToAnyPublisher()
        viewModelToTest.callLoginService(email: "", password: "")
        
        wait(for: [expectation], timeout: 1)
    }
}
