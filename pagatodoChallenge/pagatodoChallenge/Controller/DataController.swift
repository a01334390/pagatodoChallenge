//
//  DataController.swift
//  pagatodoChallenge
//
//  Created by Fernando Martin Garcia Del Angel on 20/05/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import UIKit
import RealmSwift

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
        DispatchQueue.global(qos: .background).async { [weak self] in
            try! self?.realm.write {
                self?.realm.add(bank)
            }
        }
    }
    
    /**
    Stores a series of [Bank Elements] in a Realm Database
    - Parameter bank: The [BankElement] to store in Realm
    */
    func store(banks: [BankElement]) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            try! self?.realm.write {
                self?.realm.add(banks)
            }
        }
    }
    
    /**
     Retrieves all the [Bank Elements] in Realm
     - Parameter completion: The [completion block] to return all results of that query
     */
    func retrieve(completion: @escaping ([BankElement]) -> ()) {
        DispatchQueue.main.async { [weak self] in
            if let banks = self?.realm.objects(BankElement.self).toArray(ofType: BankElement.self) {
                completion(banks)
            } else {
                completion([])
            }
        }
    }
}
