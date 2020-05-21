//
//  BankFeed.swift
//  pagatodoChallenge
//
//  Created by Fernando Martin Garcia Del Angel on 20/05/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import Foundation
import Keys

class BankFeed: ObservableObject, RandomAccessCollection {
    // MARK: - Fundamental Properties
    typealias Element = Bank
    @Published var bankList = [Bank]()
    
    // MARK: - Random Access Collection elements
    var startIndex: Int { bankList.startIndex }
    var endIndex: Int { bankList.endIndex }
    
    subscript(position: Int) -> Bank {
        return bankList[position]
    }
    
    init() {
        self.loadBankDetails()
    }
    
    // MARK: - Character Downloader Methods
    
    /**
     Starts up the Bank Loading Details by using the encoded URL
     */
    private func loadBankDetails() {
        if let url = URL(string: PagatodoChallengeKeys().pagatodoURL) {
            let task = URLSession.shared.dataTask(with: url,completionHandler: parseBanksFromResponse(data:response:error:))
            task.resume()
        }
    }
    
    /**
     Parses bank elements from response
     - Parameters:
     - data: Response as a Data Array in the URLSession.
     - response: Response in the URLSession Data Task, can be nil.
     - error: Error in the URLSession Data Task, might be nil.
     */
    private func parseBanksFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            logger(message: "An error has occured: \(error?.localizedDescription ?? "Unknown")")
            return
        }
        
        guard let data = data else {
            logger(message: "data was empty")
            return
        }
        
        let banks = parseBanksFromData(data: data)
        
        DispatchQueue.main.async { [weak self] in
            self?.bankList.append(contentsOf: banks)
            if banks.count > 0 {
                self?.logger(message: "Completed loading banks.")
            } else {
                self?.logger(message: "An error occured while appending data.")
            }
        }
        
    }
    /**
     Parses bank elements from data
     - Note: An error can trigger the return of an empty array
     - Parameters:
     - data: Response as a Data Array in the URLSession.
     */
    private func parseBanksFromData(data: Data) -> [Bank] {
        var response: [Bank] = []
        do {
            response = try JSONDecoder().decode([Bank].self, from: data)
        } catch {
            logger(message: error.localizedDescription)
            return []
        }
        
        return response
    }
    
    // MARK: - Helper Methods
    
    /**
     Simple unified logger function
     - Parameter message: The message to be logged.
     */
    private func logger(message: String) {
        print("[Bank Feed] - \(message)")
    }
    
}
