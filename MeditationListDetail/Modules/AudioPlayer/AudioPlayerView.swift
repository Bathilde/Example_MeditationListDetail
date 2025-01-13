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
                    Button(action: {
                        if audioViewModel.isPlaying {
                            audioViewModel.pause()
                        } else {
                            audioViewModel.play()
                        }
                    }, label: {
                        Text(Image(systemName: audioViewModel.isPlaying ? "pause.fill" : "play.fill"))
                            .font(Font.system(size: 16))
                            .foregroundColor(.primaryTextColor)
                            .frame(width: 32, height: 32)
                            .background(Color.buttonColor.cornerRadius(300))

                    })
                    .buttonStyle(AnimatedButtonStyle())
                    .accessibility(label: Text(meditation.name))

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
                Color.secondaryTextColor
                    .frame(height: 2)
                    .padding(.vertical, 6)
                    .overlay(alignment: .leading) {
                        GeometryReader { proxy in
                            Color.button.frame(width: 12, height: 12).cornerRadius(12)
                                .padding(.leading, audioViewModel.audioTotalDuration > 0 ? proxy.size.width * audioViewModel.audioCurrentOffset / audioViewModel.audioTotalDuration : 0)
                        }
                    }
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
