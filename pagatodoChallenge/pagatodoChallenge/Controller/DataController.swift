//
//  DataController.swift
//  pagatodoChallenge
//
//  Created by Fernando Martin Garcia Del Angel on 20/05/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import UIKit
import RealmSwift

class DataController : NSObject {
    // MARK: - Shared Properties
    private static var sharedDC : DataController = {
        return DataController()
    }()
    
    private let realm = try! Realm()
    
    // MARK: - Accesors
    class func shared() -> DataController {
        return sharedDC
    }
    
    // MARK: - Other methods
    
    /**
     Stores a Bank Element in a Realm Database
     - Parameter bank: The [BankElement] to store in Realm
     */
    func store(bank: BankElement) {
        
        try! realm.write {
            realm.add(bank)
        }
        
    }
    
    /**
     Stores a series of [Bank Elements] in a Realm Database
     - Parameter bank: The [BankElement] to store in Realm
     */
    func store(banks: [BankElement]) {
        try! realm.write {
            realm.add(banks)
            UserDefaults.set(hasDataStored: true)
        }
    }
    
    /**
     Retrieves all the [Bank Elements] in Realm
     - Parameter completion: The [completion block] to return all results of that query
     */
    func retrieve(completion: @escaping ([BankElement]) -> ()) {
        let banks = realm.objects(BankElement.self).toArray(ofType: BankElement.self)
        completion(banks)
    }
}
