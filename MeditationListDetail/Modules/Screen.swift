//
//  Screen.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 10/01/2025.
//

import SwiftUI

struct Screen: View {
    enum Display {
        case list
        case detail(Meditation)
    }

    @State var display: Display = .list

    var body: some View {
        ScrollView(.vertical) {
            HeaderBackground()

            VStack(alignment: .leading, spacing: 0) {
                switch (display) {
                case .list:
                    ListView(detailAction: { meditation in
                        withAnimation {
                            display = .detail(meditation)
                        }
                    },
                             playAction: { meditation in},
                             favoriteAction: { meditation in})
                    .frame(minHeight: 400)
                case .detail(let meditation):
                    DetailView(meditation: meditation,
                               backAction: {
                        withAnimation {
                            display = .list
                        }
                    },
                               playAction: {},
                               favoriteAction: {})
                    .frame(minHeight: 400)
                }
            }
            .padding(.top, -60)

            FooterBackground()
        }
        .background(Color.backgroundColor)
    }
}

#Preview {
    Screen()
}
