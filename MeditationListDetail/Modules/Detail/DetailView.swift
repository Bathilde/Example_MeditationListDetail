//
//  DetailView.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 10/01/2025.
//

import SwiftUI

struct DetailView: View {
    let meditation: Meditation

    let backAction: () -> Void
    let playAction: () -> Void
    let favoriteAction: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            HStack(alignment: .top, spacing: 12) {
                Button(action: {
                    backAction()
                }, label: {
                    Text(Image(systemName: "chevron.backward"))
                        .font(Font.system(size: 16))
                        .foregroundColor(.primaryTextColor)
                        .frame(width: 32, height: 32)
                        .background(Color.buttonColor.cornerRadius(300))

                })
                .buttonStyle(AnimatedButtonStyle())

                VStack(alignment: .leading, spacing: 4) {
                    Text(meditation.name)
                        .font(Font.system(size: 24, weight: .semibold))
                        .foregroundColor(.primaryTextColor)
                    Text(meditation.category)
                        .font(Font.system(size: 10, weight: .medium))
                        .foregroundColor(.secondaryTextColor)
                }
                .frame(maxWidth: .infinity, alignment: .leading)


                Button(action: {
                    playAction()
                }, label: {
                    Text(Image(systemName: "play.fill"))
                        .font(Font.system(size: 16))
                        .foregroundColor(.primaryTextColor)
                        .frame(width: 32, height: 32)
                        .background(Color.buttonColor.cornerRadius(300))

                })
                .buttonStyle(AnimatedButtonStyle())

                Button(action: {
                    favoriteAction()
                }, label: {
                    Text(Image(systemName: meditation.isFavorite ? "heart.fill" : "heart"))
                        .font(Font.system(size: 16))
                        .foregroundColor(.primaryTextColor)
                        .padding(6)
                })
                .buttonStyle(AnimatedButtonStyle())
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 36)

            Text(meditation.transcript)
                .font(Font.system(size: 12))
                .lineSpacing(2)
                .foregroundColor(.primaryTextColor)
                .padding(.horizontal, 36)

            Spacer()
        }
    }
}

#Preview {
    DetailView(meditation: Meditation(name: "Meditation 1", category: "Category 1", isFavorite: false, transcript: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sapien quam, euismod sit amet vehicula eget, tincidunt eget nibh. Integer non dictum tellus. Etiam sollicitudin leo felis, ac fringilla ex venenatis sit amet. Quisque placerat massa eget imperdiet aliquet. Morbi vel interdum elit. Fusce sodales velit nec tempor tincidunt. Curabitur sit amet neque suscipit, sagittis dui vel, pellentesque nisi. Suspendisse bibendum eu diam at dignissim.\nNulla facilisi. Ut at nisi congue mi accumsan consequat. Vestibulum vestibulum lorem quis aliquam semper. Nunc lectus leo, interdum quis mattis tristique, convallis a nibh. Aliquam ullamcorper ornare ex, vitae cursus velit pellentesque id. Phasellus cursus neque eu diam sodales auctor. Donec posuere ante a lorem gravida luctus. Etiam purus nunc, fermentum ut augue sed, sodales tincidunt dolor. Nam rhoncus tellus justo, at rhoncus sapien pretium ut. Etiam auctor ex non mauris eleifend auctor. Nam ligula dui, pulvinar eu elementum id, fringilla eu diam. Ut lacinia lectus sed quam imperdiet pulvinar. Nullam facilisis leo eu odio tincidunt, vel mollis urna scelerisque. Nullam nisi nulla, blandit nec erat et, ullamcorper tempus lectus."), backAction: {}, playAction: {}, favoriteAction: {})
        .background(Color.backgroundColor)
}
