//
//  Toast.swift
//  pagatodoChallenge
//
//  Created by Fernando Martin Garcia Del Angel on 21/05/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import SwiftUI

struct Toast<Presenting>: View where Presenting: View {
    /// The binding that decides the appropriate drawing in the body.
    @Binding var isShowing: Bool
    /// The view that will be "presenting" this toast
    let presenting: () -> Presenting
    /// The text to show
    let text: Text
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                self.presenting()

                VStack {
                    Spacer()
                    VStack {
                        self.text
                            .bold()
                            .font(.headline)
                            .padding()
                    }
                    .frame(width: geometry.size.width - 20,
                           height: geometry.size.height / 10)
                        .background(Color.secondary)
                    .foregroundColor(Color.primary)
                    .cornerRadius(20)
                    .transition(.slide)
                    .opacity(self.isShowing ? 1 : 0)
                    .padding(.bottom)
                }
            }
        }
    }
}

