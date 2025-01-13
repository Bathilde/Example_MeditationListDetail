//
//  Meditation.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 10/01/2025.
//

import SwiftData

@Model()
class Meditation {
    var id: String
    var name: String
    var category: String
    var isFavorite: Bool

    var fileName: String
    var transcript: String

    init(id: String, name: String, category: String, isFavorite: Bool, fileName: String, transcript: String) {
        self.id = id
        self.name = name
        self.category = category
        self.isFavorite = isFavorite
        self.fileName = fileName
        self.transcript = transcript
    }
}
