//
//  BankElement.swift
//  pagatodoChallenge
//
//  Created by Fernando Martin Garcia Del Angel on 20/05/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import UIKit
import RealmSwift

// MARK: - BankElement
class BankElement: Object, Codable {
    let bankName, bankDescription: String?
    let age: Int?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case bankName
        case bankDescription = "description"
        case age, url
    }
}

typealias Bank = [BankElement]
