//
//  FavoriteButton.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 14/01/2025.
//

import SwiftUI

struct FavoriteButton: View {
    let action: () -> Void
    let isFavorite: Bool

    var body: some View {
        Button(action: action) {
            Text(Image(systemName: isFavorite ? "heart.fill" : "heart"))
                .font(Font.system(size: 16))
                .foregroundColor(.primaryTextColor)
                .padding(6)
        }
        .buttonStyle(AnimatedButtonStyle())
        .accessibilityLabel(isFavorite ? "favorite_remove" : "favorite_add")
    }
}
