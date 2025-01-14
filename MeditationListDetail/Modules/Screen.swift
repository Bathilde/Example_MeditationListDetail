//
//  Screen.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 10/01/2025.
//

import SwiftUI
import SwiftData

struct Screen: View {
    enum Display {
        case list
        case detail(Meditation)
    }

    @Environment(\.modelContext) private var modelContext
    @State var display: Display = .list
    private let playingMeditationViewModel = AudioPlayerViewModel()

    private func initDataIfNeeded() async {
        let fetchDescriptor = FetchDescriptor<Meditation>(sortBy: [SortDescriptor(\.id)])
        let meditations = try? modelContext.fetch(fetchDescriptor).count
        if meditations == 0 {
            let meditations: [Meditation] = Meditation.build
            meditations.forEach {
                modelContext.insert($0)
            }

            try? modelContext.save()
        }
    }

    private func play(meditation: Meditation) {
        playingMeditationViewModel.setUp(meditation: meditation)
    }

    private func favorite(meditation: Meditation) {
        meditation.isFavorite.toggle()
        try? modelContext.save()
    }

    private func displayMeditation(meditation: Meditation) {
        withAnimation {
            display = .detail(meditation)
        }
    }

    private func displayList() {
        withAnimation {
            display = .list
        }
    }

    var body: some View {
        ScrollView(.vertical) {
            HeaderBackground()

            VStack(alignment: .leading, spacing: 0) {
                switch (display) {
                case .list:
                    ListView(detailAction: displayMeditation,
                             playAction: play,
                             favoriteAction: favorite)
                    .frame(minHeight: 400)
                    .transition(.move(edge: .leading))
                    .environment(playingMeditationViewModel)
                case .detail(let meditation):
                    DetailView(meditation: meditation,
                               backAction: displayList,
                               playAction: { play(meditation: meditation)},
                               favoriteAction: {favorite(meditation: meditation)})
                    .frame(minHeight: 400)
                    .transition(.move(edge: .trailing))
                    .environment(playingMeditationViewModel)
                }
            }
            .padding(.top, -60)

            FooterBackground()
        }
        .overlay(alignment: .bottom, content: {
            AudioPlayerView()
                .environment(playingMeditationViewModel)
        })
        .background(Color.backgroundColor)
        .task {
            await initDataIfNeeded()
        }
    }
}

@available(iOS 18.0, *)
#Preview(traits: .sampleData) {
    Screen()
}
