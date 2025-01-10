//
//  FooterBackground.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 10/01/2025.
//

import SwiftUI

struct FooterBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Image("bottom_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width,
                       height: max(UIScreen.main.bounds.height - geometry.frame(in: .global).minY, 0))
        }
        .frame(height: 175)
        .padding(.top, 50)
    }
}

#Preview {
    ScrollView{
        VStack{
            Spacer(minLength: 800)
            FooterBackground()
        }
    }
}
