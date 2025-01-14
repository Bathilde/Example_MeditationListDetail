//
//  ListView.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 10/01/2025.
//

import SwiftUI
import SwiftData

struct ListView: View {
    @Query(sort: \Meditation.id)
    var meditations: [Meditation]
    @State var search: String = ""
    @State var isFavorite: Bool = false

    var filteredMeditations: [Meditation] {
        meditations.filter({
            ((isFavorite && $0.isFavorite) || !isFavorite)
            && (search.isEmpty || $0.name.contains(search) || $0.category.contains(search))
        })
    }

    let detailAction: (Meditation) -> Void
    let playAction: (Meditation) -> Void
    let favoriteAction: (Meditation) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 4) {
                Text("List.ListView.title")
                    .font(Font.system(size: 28, weight: .bold))
                    .foregroundColor(.primaryTextColor)

                Text("List.ListView.description")
                    .font(Font.system(size: 12, weight: .medium))
                    .foregroundColor(.secondaryTextColor)
                    .lineLimit(nil)
                    .padding(.top, 4)

                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.secondaryTextColor)
                    .padding(.top, 20)
                    .padding(.bottom, 8)

                HStack(spacing: 8) {
                    TextField("🔎 Search", text: $search)
                        .font(Font.system(size: 12, weight: .medium))
                        .foregroundColor(.secondaryTextColor)
                        .padding(2)
                        .background(alignment: .bottom) {
                            Color.secondaryTextColor.frame(height: 1)
                        }
                        .padding(8)

                    FavoriteButton(
                        action: { isFavorite.toggle() },
                        isFavorite: isFavorite
                    )
                }

            }
            .padding(.horizontal, 36)
            .padding(.bottom, 12)

            ForEach(filteredMeditations, id: \.id) { meditation in
                MeditationsCellView(
                    meditation: meditation,
                                    detailAction: detailAction,
                                    playAction: playAction,
                                    favoriteAction: favoriteAction
                )
            }

            Spacer()
        }
    }
}

@available(iOS 18.0, *)
#Preview(traits: .sampleData) {
    @Previewable var audioEnv = AudioPlayerViewModel()
    ListView(detailAction: { _ in}, playAction: { _ in}, favoriteAction: { _ in})
        .background(Color.backgroundColor)
        .environment(audioEnv)
}
