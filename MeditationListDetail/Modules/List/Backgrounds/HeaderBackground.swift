//
//  HeaderBackground.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 10/01/2025.
//

import SwiftUI

struct HeaderBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Image("header_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(findOpacity(headerOffset: geometry.frame(in: .global).minY))
                .offset(y: -geometry.frame(in: .global).minY)
                .frame(width: UIScreen.main.bounds.width,
                       height: max(geometry.frame(in: .global).minY + 220, 0))
        }
        .frame(height: 220)
    }


    private func findOpacity(headerOffset: CGFloat) -> Double {
        guard headerOffset < 0 else { return 1.0 }

        let hideOffset: CGFloat = 150.0
        let showOffset: CGFloat = 50.0

        switch abs(headerOffset) {
        case let x where x > hideOffset:
            return 0.0
        case let x where x <= hideOffset && x > showOffset:
            return 1.0 - Double((x - showOffset) / (hideOffset - showOffset))
        default:
            return 1.0
        }
    }
}

#Preview {
    ScrollView{
        VStack{
            HeaderBackground()
            Spacer()
        }
    }
}
