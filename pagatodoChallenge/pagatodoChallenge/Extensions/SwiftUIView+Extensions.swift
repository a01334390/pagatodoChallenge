//
//  SwiftUIView+Extensions.swift
//  pagatodoChallenge
//
//  Created by Fernando Martin Garcia Del Angel on 21/05/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import SwiftUI

extension View {
    func toast(isShowing: Binding<Bool>, text: Text) -> some View {
        Toast(isShowing: isShowing,
              presenting: { self },
              text: text)
    }
}
