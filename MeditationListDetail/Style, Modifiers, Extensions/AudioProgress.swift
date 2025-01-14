//
//  AudioProgress.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 14/01/2025.
//

import SwiftUI

struct AudioProgress: View {
    let percentage: Double

    var body: some View {
        Color.secondaryTextColor
            .frame(height: 2)
            .padding(.vertical, 6)
            .overlay(alignment: .leading) {
                GeometryReader { proxy in
                    Color.button.frame(width: 12, height: 12).cornerRadius(12)
                        .padding(.leading, proxy.size.width * percentage)
                }
            }
    }
}
