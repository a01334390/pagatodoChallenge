//
//  BankListView.swift
//  pagatodoChallenge
//
//  Created by Fernando Martin Garcia Del Angel on 20/05/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import SwiftUI

struct BankListView: View {
    //MARK: - Properties
    @ObservedObject var bankFeed = BankFeed()
    @State private var searchText: String = ""
    
    //MARK: - Body
    var body: some View {
        VStack {
            SearchBar(text: $searchText, placeholder: "Search for banks...")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (alignment: .center, spacing: 10) {
                    ForEach(bankFeed.bankList,id: \.self) { bank in
                        Card(bank: bank)
                    }
                }
            }
        }
    }
}

struct BankListView_Previews: PreviewProvider {
    static var previews: some View {
        BankListView()
    }
}
