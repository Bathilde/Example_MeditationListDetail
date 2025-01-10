//
//  RoundedBackgroundModifier.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 10/01/2025.
//

import SwiftUI

struct RoundedBackgroundModifier: ViewModifier {
    var backgroundColor: Color = .backgroundColor
    var borderColor: Color = .backgroundColor
    var cornerRadius: CGFloat = 300
    var borderWidth: CGFloat = 1

    func body(content: Content) -> some View {
        content.background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(borderColor, lineWidth: borderWidth)
                .foregroundColor(borderColor)
                .background(backgroundColor.cornerRadius(cornerRadius))
        )
    }
}
