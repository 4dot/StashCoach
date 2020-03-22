//
//  AchievementInteractor.swift
//  StashCoach
//
//  Created by OGiP on 3/19/20.
//  Copyright (c) 2020 Chanick Park. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class AchievementInteractor {
    // Create Network manager with NetworkClient
    var achievementNetworkManager = AchievementNetworkManager(client: StashNetworkClient())
}

// MARK: - Network request

extension AchievementInteractor: AchievementInteractorInterface {
    func retrieveAchievement(_ complete: @escaping AchievementListCompletionBlock) {
        self.achievementNetworkManager.retrieveAchievementList { (title, achievements) -> Void in
            complete(title, achievements)
        }
    }
}