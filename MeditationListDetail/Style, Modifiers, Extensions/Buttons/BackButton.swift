//
//  BackButton.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 14/01/2025.
//

import SwiftUI

struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(
            action: action,
            label: {
                Text(Image(systemName: "chevron.backward"))
                    .font(Font.system(size: 16))
                    .foregroundColor(.primaryTextColor)
                    .frame(width: 32, height: 32)
                    .background(Color.buttonColor.cornerRadius(300))

            })
        .buttonStyle(AnimatedButtonStyle())
    }
}
