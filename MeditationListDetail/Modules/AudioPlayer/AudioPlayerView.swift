//
//  AudioPlayerView.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 13/01/2025.
//

import SwiftUI
import SwiftData

struct AudioPlayerView: View {
    @Environment(AudioPlayerViewModel.self) var audioViewModel

    var body: some View {
        if let meditation = audioViewModel.meditation {
            VStack(spacing: 16) {
                HStack(spacing: 12) {
                    PlayButton(
                        action: {
                            if audioViewModel.isPlaying {
                                audioViewModel.pause()
                            } else {
                                audioViewModel.play()
                            }
                        },
                        isPlaying: audioViewModel.isPlaying
                    )

                    VStack(alignment: .leading, spacing: 4) {
                        Text(meditation.name)
                            .font(Font.system(size: 12, weight: .semibold))
                            .foregroundColor(.primaryTextColor)
                        Text(meditation.category)
                            .font(Font.system(size: 10, weight: .medium))
                            .foregroundColor(.secondaryTextColor)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                AudioProgress(percentage: audioViewModel.audioTotalDuration > 0 ? audioViewModel.audioCurrentOffset / audioViewModel.audioTotalDuration : 0)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 44)
            .background(alignment: .top) {
                Color.primaryTextColor.frame(height: 1)
            }
            .background(alignment: .top) {
                Color.backgroundColor.ignoresSafeArea()
            }
        }
    }
}
@available(iOS 18.0, *)
#Preview(traits: .sampleData) {
    @Previewable @Query var meditations: [Meditation]
    @Previewable var audioEnv = AudioPlayerViewModel()
    VStack(spacing: 0) {
        Spacer()
        AudioPlayerView()
            .environment(audioEnv)
            .onAppear {
                audioEnv.setUp(meditation: meditations[0])
            }
    }
    .background(Color.secondaryTextColor)
}
