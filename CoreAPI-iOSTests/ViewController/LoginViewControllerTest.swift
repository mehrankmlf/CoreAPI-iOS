//
//  LoginViewControllerTest.swift
//  CoreAPI-iOSTests
//
//  Created by Mehran on 3/22/1401 AP.
//

import XCTest

@testable import CoreAPI_iOS

class LoginViewControllerTest: XCTestCase {
    
    var sut : LoginViewController!

    override func setUp() {
        super.setUp()
        if(sut != nil) {
            sut.loadView()
            sut.viewDidLoad()
        }
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}
