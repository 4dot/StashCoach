//
//  MockAchievementInteractor.swift
//  StashCoachTests
//
//  Created by Chanick Park on 3/22/20.
//  Copyright © 2020 Chanick Park. All rights reserved.
//

import XCTest
@testable import StashCoach


final class MockAchievementInteractor : XCTestCase {
    // Create Network manager with NetworkClient
    var achievementNetworkManager = MockAchievementNetworkManager(client: MockStashNetworkClient())
}

// MARK: - Network request

extension MockAchievementInteractor: AchievementInteractorInterface {
    func retrieveAchievement(_ complete: @escaping AchievementListCompletionBlock) {
        self.achievementNetworkManager.retrieveAchievementList { (title, achievements) -> Void in
            complete(title, achievements)
        }
    }
}

extension MockAchievementInteractor {
    
    //
    // Test retrieveAchievement()
    //
    func testRetrieveAchievement() {
        retrieveAchievement { (title, result) -> (Void) in
            switch result {
            case .success(let achievements):
                XCTAssertEqual(title, "Smart Investing")
                XCTAssertEqual(achievements.count, 3)
                
            case .failure(let errors):
                XCTFail(errors.first?.description ?? "")
            }
        }
    }
    
    //
    // Test load "achievements" only from json with keyPath
    //
    func testRetrieveAchievementOnly() {
        achievementNetworkManager.client.request(path: achievementNetworkManager.path, keyPath: "achievements") { (result: NetworkClientResult<[Achievement]> ) in
            switch result {
            case .success(let achievements):
                XCTAssertEqual(achievements.count, 3)
                
            case .failure(let errors):
                XCTFail(errors.first?.description ?? "")
            }
        }
    }
    
    //
    // Test load whole json data
    //
    func testRetrieveAchievementAll() {
        achievementNetworkManager.client.request(path: achievementNetworkManager.path) { (result: NetworkClientResult<Data>) in
            switch result {
                // success
                case .success(let data):
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] {
                            // get title, achievements
                            guard let overview = json["overview"] as? [String : Any],
                                let achievements = json["achievements"] as? [Any] else {
                                    XCTFail(BundleRequestError.invalidData.localizedDescription)
                                    return
                            }
                            
                            let success = json["success"] as? Bool
                            let status = json["status"] as? Int
                            let title = overview["title"] as? String
                            
                            XCTAssertEqual(success, true)
                            XCTAssertEqual(status, 200)
                            XCTAssertEqual(title, "Smart Investing")
                            XCTAssertEqual(achievements.count, 3)
                            
                            
                        }
                    } catch let error {
                        XCTFail(error.localizedDescription)
                    }
            
                // failure
                case .failure(let errors):
                    XCTFail(errors.first?.description ?? "")
            }
        }
    }
}
