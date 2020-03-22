//
//  MockAchievementWireframe.swift
//  StashCoachTests
//
//  Created by OGiP on 3/22/20.
//  Copyright © 2020 Chanick Park. All rights reserved.
//

import XCTest
@testable import StashCoach


final class MockAchievementWireframe {
    var viewController: MockAchievementViewController?

    // MARK: - init

    init() {
        let moduleViewController = MockAchievementViewController()
        let interactor = MockAchievementInteractor()
        let presenter = MockAchievementPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
        
        viewController = moduleViewController
    }

    private func openDetailView(with achievement: Achievement) {
        // Open detail view
        //navigationController?.pushWireframe(AchievementDetailWireframe(achievement))
        showAlert(with: "Warning", message: "This feature is unavailable now.")
    }
}

// MARK: - AchievementWireframeInterface

extension MockAchievementWireframe: AchievementWireframeInterface {
    func popFromNavigationController(animated: Bool) {
        showAlert(with: "Message", message: "popFromNavigationController")
    }
    
    func dismiss(animated: Bool) {
        showAlert(with: "Message", message: "dismiss")
    }
    
    func showErrorAlert(with message: String?) {
        showAlert(with: "Error", message: "showErrorAlert")
    }
    
    func showAlert(with title: String?, message: String?) {
        print("\(title ?? "no title"): \(message ?? "no message")")
    }
    
    func showAlert(with title: String?, message: String?, actions: [UIAlertAction]) {
        showAlert(with: title, message: message)
    }
    
    func navigate(to option: AchievementNavigationOption) {
        switch option {
        case .details(let achievement):
            openDetailView(with: achievement)
        }
    }
}
