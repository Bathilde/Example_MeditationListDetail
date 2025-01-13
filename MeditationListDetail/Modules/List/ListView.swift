//
//  ListView.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 10/01/2025.
//

import SwiftUI
import SwiftData

struct ListView: View {
    let meditations: [Meditation]

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

            ForEach(meditations, id: \.id) { meditation in
                MeditationsCellView(meditation: meditation, detailAction: detailAction, playAction: playAction, favoriteAction: favoriteAction)
            }

            Spacer()
        }
    }
}

@available(iOS 18.0, *)
#Preview {
    @Previewable @Query var meditations: [Meditation]
    ListView(meditations: meditations,
             detailAction: { _ in}, playAction: { _ in}, favoriteAction: { _ in})
        .background(Color.backgroundColor)
}
