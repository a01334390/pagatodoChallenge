//
//  Realm+Extensions.swift
//  pagatodoChallenge
//
//  Created by Fernando Martin Garcia Del Angel on 20/05/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import Foundation
import Realm

extension Results {
    /**
     Converts the Results Object to an Array of the same type
     - Parameter ofType: The type of element to be converted into an Array
     - Returns: An array composed of that type
     */
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }

        return array
    }
}
