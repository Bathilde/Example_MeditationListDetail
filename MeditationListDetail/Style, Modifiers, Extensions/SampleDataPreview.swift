//
//  SampleData.swift
//  MeditationListDetail
//
//  Created by Bathilde Rocchia on 13/01/2025.
//

import SwiftData
import SwiftUI

struct SampleDataPreview: PreviewModifier {
    static func makeSharedContext() throws -> ModelContainer {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(
            for: Meditation.self,
            configurations: config
        )
        SampleDataPreview.createSampleData(into: container.mainContext)
        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
    
    static func createSampleData(into modelContext: ModelContext) {
        Task { @MainActor in
            let meditations: [Meditation] = Meditation.build
            meditations.forEach {
                modelContext.insert($0)
            }
            
            try? modelContext.save()
        }
    }
}

@available(iOS 18.0, *)
extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var sampleData: Self = .modifier(SampleDataPreview())
}
