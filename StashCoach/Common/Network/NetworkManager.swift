//
//  NetworkManager.swift
//  GitHubBrowser
//
//  Created by Chanick on 8/22/19.
//  Copyright (c) 2019 Chanick Park. All rights reserved.
//

import Foundation

//
// NetworkManager protocol
//
protocol NetworkManager {
    var client: NetworkClient { get }
    var path: String { get }
}
