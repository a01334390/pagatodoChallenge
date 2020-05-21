//
//  UserDefaults+Extensions.swift
//  pagatodoChallenge
//
//  Created by Fernando Martin Garcia Del Angel on 20/05/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import Foundation

extension UserDefaults {
    private struct Keys {
        // MARK: - Constants
        static let hasDataStored = "hasDataStored"
    }
    
    // MARK: - Simple storing notation
    class var hasDataStored: Bool {
        let storedValue = UserDefaults.standard.bool(forKey: UserDefaults.Keys.hasDataStored)
        return storedValue
    }
    
    class func set(hasDataStored: Bool) {
        UserDefaults.standard.set(hasDataStored, forKey: UserDefaults.Keys.hasDataStored)
    }
}
