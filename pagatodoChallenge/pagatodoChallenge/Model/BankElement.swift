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
class BankElement: Object, Codable, Identifiable {
    @objc dynamic var bankName, bankDescription: String
    @objc dynamic var age: Int
    @objc dynamic var url: String

    enum CodingKeys: String, CodingKey {
        case bankName
        case bankDescription = "description"
        case age, url
    }
    
    init(bankName: String, bankDescription: String, age: Int, url: String) {
        self.bankName = bankName
        self.bankDescription = bankDescription
        self.age = age
        self.url = url
        super.init()
    }
    
    required init() {
        self.bankName = "bankName"
        self.bankDescription = "bankDescription"
        self.age = 0
        self.url = "url"
    }
}

typealias Bank = [BankElement]
