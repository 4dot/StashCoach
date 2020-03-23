//
//  MockNetworkManager.swift
//  StashCoachTests
//
//  Created by Chanick Park on 3/22/20.
//  Copyright © 2020 Chanick Park. All rights reserved.
//

import Foundation
@testable import StashCoach

//
// MockNetworkManager protocol
//
protocol MockNetworkManager {
    var client: NetworkClient { get }
    var path: String { get }
}
