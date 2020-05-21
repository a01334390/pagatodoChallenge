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
    
    var body: some View {
        ZStack {
            WebImage(url: URL(string: bank.url)!)
            .resizable()
            .placeholder(Image("defaultIMG"))
            .indicator(.activity)
            .transition(.fade)
            .scaledToFill()
            Rectangle()
                .foregroundColor(.clear)
             .frame(minWidth: 100, idealWidth: 100, maxWidth: 100, minHeight: 100, idealHeight: 100, maxHeight: 100, alignment: .center)
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundColor(.white)
                        Text(bank.bankName)
                            .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    }.padding()
                }
                Spacer()
                
                Text(bank.bankDescription)
                .font(.custom("Roboto", size: 30))
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .lineLimit(3)
                
                
            }
            .padding()
        }
        .frame(minWidth: 300, idealWidth: 350, maxWidth: 350, minHeight: 450, idealHeight: 500, maxHeight: 600, alignment: .center)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(bank: BankElement(bankName: "Paga Todo", bankDescription: "Banco Paga Todo es Para Todos", age: 10, url: "https://public-liarla.s3.us-east-2.amazonaws.com/ico_pagatodo.png"))
    }
}
