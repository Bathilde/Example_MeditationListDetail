//
//  MeditationsCellView.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 10/01/2025.
//

import SwiftUI
import SwiftData

struct MeditationsCellView: View {
    @Environment(AudioPlayerViewModel.self) var audioViewModel
    
    let meditation: Meditation

    let detailAction: (Meditation) -> Void
    let playAction: (Meditation) -> Void
    let favoriteAction: (Meditation) -> Void

    var body: some View {
        HStack(spacing: 12) {
            PlayButton(
                action: { playAction(meditation) },
                isPlaying: audioViewModel.meditation?.id == meditation.id && audioViewModel.isPlaying
            )

            Button(action: {
                detailAction(meditation)
            }, label: {
                VStack(alignment: .leading, spacing: 2) {
                    Text(meditation.name)
                        .font(Font.system(size: 16, weight: .semibold))
                        .foregroundColor(.primaryTextColor)
                    Text(meditation.category)
                        .font(Font.system(size: 10, weight: .medium))
                        .foregroundColor(.secondaryTextColor)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            })
            .accessibility(label: Text(meditation.name))

            FavoriteButton(
                action: { favoriteAction(meditation) },
                isFavorite: meditation.isFavorite
            )
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 36)
    }
}

@available(iOS 18.0, *)
#Preview(traits: .sampleData) {
    @Previewable @Query var meditations: [Meditation]
    VStack(spacing: 0) {
        MeditationsCellView(meditation: meditations[0], detailAction: { _ in}, playAction: { _ in}, favoriteAction: { _ in})
        MeditationsCellView(meditation: meditations[1], detailAction: { _ in}, playAction: { _ in}, favoriteAction: { _ in})
        MeditationsCellView(meditation: meditations[2], detailAction: { _ in}, playAction: { _ in}, favoriteAction: { _ in})
    }
    .background(Color.backgroundColor)
}
