//
//  Array+extension.swift
//  StashCoach
//
//  Created by OGiP on 3/20/20.
//  Copyright © 2020 Chanick Park. All rights reserved.
//

import Foundation


extension Array {
    subscript (safe index: Index) -> Element? {
        return (index >= 0 && index < count) ? self[index] : nil
    }
}
