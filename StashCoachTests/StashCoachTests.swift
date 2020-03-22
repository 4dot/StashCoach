//
//  StashCoachTests.swift
//  StashCoachTests
//
//  Created by OGiP on 3/19/20.
//  Copyright © 2020 Chanick Park. All rights reserved.
//

import XCTest
@testable import StashCoach

class StashCoachTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testViper() {
        let wireframe = MockAchievementWireframe()
        
        guard let view = wireframe.viewController else {
            XCTFail("Error: Can't find Archievement View")
            return
        }
        
        guard let presenter = view.presenter as? MockAchievementPresenter else {
            XCTFail("Error: Can't find Archievement Presenter")
            return
        }
        
        // load file
        view.viewDidLoad()
        
        // wait for object and predicate
        waitFor(object: presenter.achievements) {
            if $0.count == 3,
               view.currStatus == .done {
                return true
            }
            return true
        }
    }
}
