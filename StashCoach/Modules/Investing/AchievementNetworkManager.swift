//
//  AchievementNetworkManager.swift
//  StashCoach
//
//  Created by OGiP on 3/20/20.
//  Copyright © 2020 Chanick Park. All rights reserved.
//

import Foundation

//
// AchievementNetworkManager
// Request Achievement List
//
typealias AchievementListCompletionBlock = (_ title: String, _ result: NetworkClientResult<[Achievement]>) -> (Void)

struct AchievementNetworkManager: NetworkManager {
    var path: String = "achievements"
    let client: NetworkClient
    
    init(client: NetworkClient) {
        self.client = client
    }
    
    //
    // Retrieve Achievement List
    //
    func retrieveAchievementList(_ complate: AchievementListCompletionBlock?) {
        client.request(path: path) { (result) in
            switch result {
            // success
            case .success(let data):
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] {
                        // get title, achievements
                        guard let overview = json["overview"] as? [String : Any],
                              let title = overview["title"] as? String,
                              let achievementsJson = json["achievements"] else {
                                complate?("", .failure([BundleRequestError.invalidData.localizedDescription]))
                                return
                        }
                            
                        // sub data to json
                        let achievementData = try JSONSerialization.data(withJSONObject: achievementsJson, options: .prettyPrinted)
                        let achievements = try JSONDecoder().decode([Achievement].self, from: achievementData)
                        
                        complate?(title, .success(achievements))
                    }
                } catch let error {
                    complate?("", .failure([error.localizedDescription]))
                }
            // failure
            case .failure(let error):
                complate?("", .failure(error))
            }
        }
    }
    
}
