//
//  MockAchievementViewController.swift
//  StashCoachTests
//
//  Created by OGiP on 3/22/20.
//  Copyright © 2020 Chanick Park. All rights reserved.
//

import UIKit
@testable import StashCoach


final class MockAchievementViewController: UIViewController {
    var presenter: AchievementPresenterInterface!
    
    enum ViewStatus {
        case none
        case waiting
        case done
    }
    
    var currStatus: ViewStatus = .none
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currStatus = .waiting
        presenter.viewDidLoad()
    }
    
}

// MARK: - AchievementViewInterface

extension MockAchievementViewController: AchievementViewInterface {
    // update Achievement Data
    func updateData(_ title: String) {
        currStatus = .done
    }
}
