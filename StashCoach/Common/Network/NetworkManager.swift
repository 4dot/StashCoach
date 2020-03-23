//
//  NetworkManager.swift
//  StashCoach
//
//  Created by Chanick Park on 3/19/20.
//  Copyright © 2020 Chanick Park. All rights reserved.
//

import Foundation

//
// NetworkManager protocol
//
protocol NetworkManager {
    var client: NetworkClient { get }
    var path: String { get }
}
