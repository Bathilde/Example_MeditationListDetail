//
//  ListView.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 10/01/2025.
//

import SwiftUI

struct ListView: View {
    let detailAction: (Meditation) -> Void
    let playAction: (Meditation) -> Void
    let favoriteAction: (Meditation) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Favorite Meditations")
                    .font(Font.system(size: 24, weight: .bold))
                    .foregroundColor(.primaryTextColor)

                Text("This is the place where you can find all your favorite meditations. Enjoy!")
                    .font(Font.system(size: 14, weight: .medium))
                    .lineLimit(nil)
                    .foregroundColor(.secondaryTextColor)
                    .padding(.top, 4)

                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.secondaryTextColor)
                    .padding(.top, 20)
                    .padding(.bottom, 16)

            }
            .padding(.horizontal, 36)

            MeditationsCellView(meditation: Meditation(name: "Meditation 1", category: "Category 1", isFavorite: false, transcript: ""), detailAction: detailAction, playAction: playAction, favoriteAction: favoriteAction)
            MeditationsCellView(meditation: Meditation(name: "Meditation 2", category: "Category 2", isFavorite: true, transcript: ""), detailAction: detailAction, playAction: playAction, favoriteAction: favoriteAction)
            MeditationsCellView(meditation: Meditation(name: "Meditation 3", category: "Category 3", isFavorite: false, transcript: ""), detailAction: detailAction, playAction: playAction, favoriteAction: favoriteAction)

            Spacer()
        }
    }
}

#Preview {
    ListView(detailAction: { _ in}, playAction: { _ in}, favoriteAction: { _ in})
        .background(Color.backgroundColor)
}
