//
//  ListViewModelTest.swift
//  CoreAPI-iOSTests
//
//  Created by Mehran on 3/20/1401 AP.
//

import XCTest
import Combine

@testable import CoreAPI_iOS

class ListViewModelTest: XCTestCase {

    var mockListService : MockListService!
    var viewModelToTest : ListViewModel!
    private var bag : Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()
        mockListService = MockListService()
        viewModelToTest = ListViewModel()
    }
    
    override func tearDown() {
        mockListService = nil
        viewModelToTest = nil
        super.tearDown()
    }
}
