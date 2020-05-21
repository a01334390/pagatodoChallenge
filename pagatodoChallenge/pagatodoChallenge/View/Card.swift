//
//  Card.swift
//  pagatodoChallenge
//
//  Created by Fernando Martin Garcia Del Angel on 20/05/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct Card: View {
    // MARK: - Properties
    var bank: BankElement
    
    // MARK: - View Functions
    private func getFoundationYear() -> String {
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let yearOfFoundation = year - bank.age
        return String(yearOfFoundation)
    }
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 5) {
                Spacer()
                HStack {
                    Text(bank.bankName)
                        .bold()
                        .font(.title)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Text(bank.bankDescription)
                        .bold()
                        .font(.headline)
                    Spacer()
                }
                HStack {
                    Text("Fundada el \(getFoundationYear())")
                        .bold()
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                }
                Spacer()
            }
            .padding()
            BadgeImage(imageURL: bank.url)
        }
        .frame(height: 200)
//        ZStack {
//            WebImage(url: URL(string: bank.url)!)
//            .resizable()
//            .placeholder(Image("defaultIMG"))
//            .indicator(.activity)
//            .transition(.fade)
//            .frame(width: 100, height: 100, alignment: .center)
//        }
//        .frame(minWidth: 300, idealWidth: 350, maxWidth: 350, minHeight: 450, idealHeight: 500, maxHeight: 500, alignment: .center)
//        .cornerRadius(15)
//        .shadow(radius: 5)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(bank: BankElement(bankName: "Paga Todo", bankDescription: "Banco Paga Todo es Para Todos", age: 10, url: "https://public-liarla.s3.us-east-2.amazonaws.com/ico_pagatodo.png"))
    }
}

struct BadgeImage: View {
    var imageURL: String
    var body: some View {
        VStack {
            Spacer()
            WebImage(url: URL(string: imageURL)!)
            .resizable()
            .placeholder(Image("defaultIMG"))
            .indicator(.activity)
            .transition(.fade)
            .frame(width: 100, height: 100, alignment: .center)
            Spacer()
        }
        .padding(.leading, 10)
        .padding(.trailing, 3)
    }
}
