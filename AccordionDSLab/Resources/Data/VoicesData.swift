//
//  ReedVoiceData.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 6. 8. 2025..
//

import Foundation
import SwiftData

struct voicesData {
    static var modelType: any PersistentModel.Type { VoicesSection.self }
    
    static func populate(modelContext: ModelContext) {
        // MARK: - DATA POPULATION METHOD
        do {
            let sortDescriptor = SortDescriptor<VoicesSection>(\.order)
            let fetchDescriptor = FetchDescriptor<VoicesSection>(sortBy: [sortDescriptor])
            let sections = try modelContext.fetch(fetchDescriptor)
            
            if sections.isEmpty {
                let reedVoice = VoicesSection(title: "", order: 1, subsections: [
                    VoicesSubsection(title: "", order: 1, paragraphs: [
                        VoicesText(text: "", imageName: "")])
                ])
                
                modelContext.insert(reedVoice)
            }
        } catch {
            print("Error loading Voices data: \(error)")
        }
    }
}
