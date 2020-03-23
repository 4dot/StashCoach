//
//  MockAchievementPresenter.swift
//  StashCoachTests
//
//  Created by Chanick Park on 3/22/20.
//  Copyright © 2020 Chanick Park. All rights reserved.
//

import XCTest
@testable import StashCoach


final class MockAchievementPresenter {
    let view: AchievementViewInterface
    let interactor: AchievementInteractorInterface
    let wireframe: AchievementWireframeInterface
    
    var achievements: [Achievement] = []
    
    init(view: AchievementViewInterface, interactor: AchievementInteractorInterface, wireframe: AchievementWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension MockAchievementPresenter: AchievementPresenterInterface {
    func viewDidLoad() {
        // request achievements
        interactor.retrieveAchievement { [weak self] (title, result) -> (Void) in
            switch result {
            case .success(let achievements):
                // update view
                self?.achievements = achievements
                self?.view.updateData(title)
                
            case .failure(let errors):
                // show popup
                self?.wireframe.showErrorAlert(with: errors.first.debugDescription)
            }
        }
    }
    
    func numberOrItems(in section: Int) -> Int {
        return achievements.count
    }
    
    func item(at indexPath: IndexPath) -> Achievement? {
        return achievements[safe: indexPath.row]
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        if let achievement = achievements[safe: indexPath.row] {
            wireframe.navigate(to: .details(achievement))
        }
    }
}
