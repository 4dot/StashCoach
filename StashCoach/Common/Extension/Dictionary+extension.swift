//
//  Dictionary+extension.swift
//  StashCoach
//
//  Created by OGiP on 3/20/20.
//  Copyright © 2020 Chanick Park. All rights reserved.
//

import Foundation


extension Dictionary {
    //
    // Update value in Immutable dictionary
    // [Key:Value]
    
    mutating func add(dictionary: [Key: Value]) {
        dictionary.forEach { (key, value) in
            self.updateValue(value, forKey: key)
        }
    }
}
