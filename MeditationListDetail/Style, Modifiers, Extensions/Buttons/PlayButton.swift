//
//  PlayButton.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 14/01/2025.
//

import SwiftUI

struct PlayButton: View {
    let action: () -> Void
    let isPlaying: Bool

    var body: some View {
        Button(action: action) {
            Text(Image(systemName: isPlaying ? "pause.fill" : "play.fill"))
                .font(Font.system(size: 16))
                .foregroundColor(.primaryTextColor)
                .frame(width: 36, height: 36)
                .background(Color.buttonColor.cornerRadius(300))
        }
        .buttonStyle(AnimatedButtonStyle())
        .accessibilityLabel(isPlaying ? "pause" : "play")
    }
}
