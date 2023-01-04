//
//  TitleViewModifier.swift
//  GuessTheFlag
//
//  Created by vsay on 1/4/23.
//

import SwiftUI

struct TitleViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.secondary)
            .padding()
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(TitleViewModifier())
    }
}
