//
//  MeditationsCellView.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 10/01/2025.
//

import SwiftUI

struct MeditationsCellView: View {

    let meditation: Meditation

    let detailAction: (Meditation) -> Void
    let playAction: (Meditation) -> Void
    let favoriteAction: (Meditation) -> Void

    var body: some View {
        HStack(spacing: 12) {
            Button(action: {
                playAction(meditation)
            }, label: {
                Text(Image(systemName: "play.fill"))
                    .font(Font.system(size: 16))
                    .foregroundColor(.primaryTextColor)
                    .frame(width: 32, height: 32)
                    .background(Color.buttonColor.cornerRadius(300))

            })
            .buttonStyle(AnimatedButtonStyle())
            .accessibility(label: Text(meditation.name))

            Button(action: {
                detailAction(meditation)
            }, label: {
                VStack(alignment: .leading, spacing: 4) {
                    Text(meditation.name)
                        .font(Font.system(size: 12, weight: .semibold))
                        .foregroundColor(.primaryTextColor)
                    Text(meditation.category)
                        .font(Font.system(size: 10, weight: .medium))
                        .foregroundColor(.secondaryTextColor)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            })

            Button(action: {
                favoriteAction(meditation)
            }, label: {
                Text(Image(systemName: meditation.isFavorite ? "heart.fill" : "heart"))
                    .font(Font.system(size: 16))
                    .foregroundColor(.primaryTextColor)
                    .padding(6)
            })
            .buttonStyle(AnimatedButtonStyle())
            .accessibility(label: Text("favorite_meditation_favorite_remove_action"))
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 36)
    }
}

#Preview {
    VStack(spacing: 0) {
        MeditationsCellView(meditation: Meditation(name: "Meditation 1", category: "Category 1", isFavorite: false, transcript: ""), detailAction: { _ in}, playAction: { _ in}, favoriteAction: { _ in})
        MeditationsCellView(meditation: Meditation(name: "Meditation 2", category: "Category 2", isFavorite: true, transcript: ""), detailAction: { _ in}, playAction: { _ in}, favoriteAction: { _ in})
        MeditationsCellView(meditation: Meditation(name: "Meditation 3", category: "Category 3", isFavorite: false, transcript: ""), detailAction: { _ in}, playAction: { _ in}, favoriteAction: { _ in})
    }
    .background(Color.backgroundColor)
}
