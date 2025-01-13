//
//  AnimatedButtonStyle.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 10/01/2025.
//

import SwiftUI

struct AnimatedButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

