//
//  DataModel.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 13/01/2025.
//

import SwiftUI
import SwiftData

actor DataModel {
    static let shared = DataModel()
    private init() {}

    nonisolated lazy var modelContainer: ModelContainer = {
        let modelContainer: ModelContainer
        do {
            modelContainer = try ModelContainer(for: Meditation.self)
        } catch {
            fatalError("Failed to create the model container: \(error)")
        }
        return modelContainer
    }()
}
