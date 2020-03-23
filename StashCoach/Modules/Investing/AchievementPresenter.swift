//
//  AchievementPresenter.swift
//  StashCoach
//
//  Created by Chanick Park on 3/19/20.
//  Copyright (c) 2020 Chanick Park. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class AchievementPresenter {

    // MARK: - Private properties

    private unowned let view: AchievementViewInterface
    private let interactor: AchievementInteractorInterface
    private let wireframe: AchievementWireframeInterface

    
    private var achievements: [Achievement] = []
    
    // MARK: - Lifecycle

    init(view: AchievementViewInterface, interactor: AchievementInteractorInterface, wireframe: AchievementWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    
}

// MARK: - AchievementPresenterInterface

extension AchievementPresenter: AchievementPresenterInterface {
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
                self?.view.updateData(title)
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
