//
//  Creation.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 13/01/2025.
//

import SwiftData

extension Meditation {
    static var build: [Meditation] {
        return [
            Meditation(id: "1", name: "Caring Meditation",
                       category: "Caring", isFavorite: false, fileName: "caring_meditation",
                       transcript: "It has been a while you haven't though of yourself. It is fine, it happens. By just starting this meditation you chose to take this time, just for you. Now it is time to inhale, and then exhale. Inhale again, then exhale, ..."),
            Meditation(id: "2", name: "Walking Meditation",
                       category: "Walking", isFavorite: false, fileName: "walking_meditation",
                       transcript: "How long are you really walking per day ? At every step, what are you seeing ? What are you smelling ? It is the perfect moment to take notice all those changes you never see. What about the color of the sky ? How is it today ?"),
            Meditation(id: "3", name: "Zen Yoga",
                       category: "Caring", isFavorite: false, fileName: "zen_yoga",
                       transcript: "Zen yoga is not about exercise, it is about caring. This time we are not talking about caring for somebody else, but caring for your environment. What about this object that has been waiting for you to let go ? Maybe it could be time to clean that and make space for a new object that you will care about. What about this messy place ? Breath in and start removing everything, so tidying become easier."),
        ]
    }
}
