//
//  AudioPlayerViewModel.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 13/01/2025.
//

import SwiftUI
import SwiftData
import AVFAudio

@Observable
final class AudioPlayerViewModel: NSObject {
    var isPlaying: Bool = true
    var audioTotalDuration: Double = 0
    var audioCurrentOffset: Double = 0
    private(set) var meditation: Meditation?
    private var player: AVAudioPlayer = AVAudioPlayer()
    private var timer: Timer?

    func setUp(meditation: Meditation) {
        guard meditation.id != self.meditation?.id else {
            if player.isPlaying {
                self.pause()
            } else {
                self.play()
            }
            return
        }
        self.meditation = meditation

        do {
            guard let url = Bundle.main.url(forResource: meditation.fileName, withExtension: "mp3") else { return }
            let data = try Data(contentsOf: url)
            player = try AVAudioPlayer(data: data)
            player.delegate = self
            player.prepareToPlay()

            audioTotalDuration = player.duration

            play()
        } catch {
            print("🔈 AVAudioPlayer:", error, error.localizedDescription)
            audioCurrentOffset = 0
            audioTotalDuration = 0
        }
    }
    
    func play() {
        player.play()
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [weak self] _ in
            withAnimation {
                self?.audioCurrentOffset = self?.player.currentTime ?? 0
            }
        })
    }

    func pause() {
        timer?.invalidate()
        player.pause()
    }

    func stop() {
        timer?.invalidate()
        player.stop()
    }
}

extension AudioPlayerViewModel: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("Finished playing")
    }
}
