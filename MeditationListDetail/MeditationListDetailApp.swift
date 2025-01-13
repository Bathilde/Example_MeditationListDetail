//
//  MeditationListDetailApp.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 10/01/2025.
//

import SwiftUI
import SwiftData

@main
struct MeditationListDetailApp: App {
    var body: some Scene {
        WindowGroup {
            Screen()
        }
        .modelContainer(for: Meditation.self)
    }
}
