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
                Button(action: {
                    backAction()
                }, label: {
                    Text(Image(systemName: "chevron.backward"))
                        .font(Font.system(size: 16))
                        .foregroundColor(.primaryTextColor)
                        .frame(width: 32, height: 32)
                        .background(Color.buttonColor.cornerRadius(300))

                })
                .buttonStyle(AnimatedButtonStyle())

                VStack(alignment: .leading, spacing: 4) {
                    Text(meditation.name)
                        .font(Font.system(size: 24, weight: .semibold))
                        .foregroundColor(.primaryTextColor)
                    Text(meditation.category)
                        .font(Font.system(size: 10, weight: .medium))
                        .foregroundColor(.secondaryTextColor)
                }
                .frame(maxWidth: .infinity, alignment: .leading)


                Button(action: {
                    playAction()
                }, label: {
                    Text(Image(systemName: audioViewModel.meditation?.id == meditation.id && audioViewModel.isPlaying ? "pause.fill" : "play.fill"))
                        .font(Font.system(size: 16))
                        .foregroundColor(.primaryTextColor)
                        .frame(width: 32, height: 32)
                        .background(Color.buttonColor.cornerRadius(300))

                })
                .buttonStyle(AnimatedButtonStyle())

                Button(action: {
                    favoriteAction()
                }, label: {
                    Text(Image(systemName: meditation.isFavorite ? "heart.fill" : "heart"))
                        .font(Font.system(size: 16))
                        .foregroundColor(.primaryTextColor)
                        .padding(6)
                })
                .buttonStyle(AnimatedButtonStyle())
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
