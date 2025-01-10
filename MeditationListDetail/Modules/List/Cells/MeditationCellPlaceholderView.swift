//
//  MeditationCellPlaceholderView.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 10/01/2025.
//

import SwiftUI

struct MeditationCellPlaceholderView: View {
    @State var opacity: Double = 0.8

    var body: some View {
        HStack(spacing: 12) {
            Color.primaryTextColor
                .frame(width: 28, height: 28)
                .padding(.leading, 6)

            VStack(alignment: .leading, spacing: 3) {
                Color.primaryTextColor
                    .frame(height: 15)

                Color.secondaryTextColor
                    .frame(height: 10)
            }
            .frame(height: 28)
            .offset(x: 0, y: 1)

            Spacer()

            Color.primaryTextColor
                .frame(width: 17, height: 14)
                .padding(6)
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 30)
        .opacity(opacity)
        .onAppear(perform: {
            withAnimation(
                Animation
                    .easeInOut(duration: 1)
                    .repeatForever(autoreverses: true),
                {
                    opacity = 0.2
                })
        })
    }
}

#Preview {
    MeditationCellPlaceholderView()
}
