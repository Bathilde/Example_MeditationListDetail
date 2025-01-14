//
//  DetailView.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 10/01/2025.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @Environment(AudioPlayerViewModel.self) var audioViewModel

    let meditation: Meditation

    let backAction: () -> Void
    let playAction: () -> Void
    let favoriteAction: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            HStack(alignment: .top, spacing: 12) {
                BackButton(action: backAction)

                VStack(alignment: .leading, spacing: 4) {
                    Text(meditation.name)
                        .font(Font.system(size: 28, weight: .bold))
                        .foregroundColor(.primaryTextColor)
                    Text(meditation.category)
                        .font(Font.system(size: 12, weight: .medium))
                        .foregroundColor(.secondaryTextColor)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                PlayButton(
                    action: playAction,
                    isPlaying: audioViewModel.meditation?.id == meditation.id && audioViewModel.isPlaying
                )

                FavoriteButton(
                    action: favoriteAction,
                    isFavorite: meditation.isFavorite
                )
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 36)

            Text(meditation.transcript)
                .font(Font.system(size: 12))
                .lineSpacing(2)
                .foregroundColor(.primaryTextColor)
                .padding(.horizontal, 36)

            Spacer()
        }
    }
}

@available(iOS 18.0, *)
#Preview(traits: .sampleData) {
    @Previewable @Query var meditations: [Meditation]
    DetailView(meditation: meditations[0], backAction: {}, playAction: {}, favoriteAction: {})
        .background(Color.backgroundColor)
}
