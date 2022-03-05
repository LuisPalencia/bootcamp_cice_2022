//
//  ButtonModifier.swift
//  CiceTmdbApp
//
//  Created by CICE on 04/03/2022.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .lineLimit(2)
            .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
            .background(
                Color(red: 239/255, green: 243/255, blue: 244/255)
            )
            .clipShape(Capsule())
    }
}

extension View {
    func buttonStyleH1() -> some View {
        self.modifier(ButtonModifier())
    }
}
