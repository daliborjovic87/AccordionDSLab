//
//  ReedVoiceModel.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 6. 8. 2025..
//

import Foundation
import SwiftData

// MARK: - VOICES SECTION MODEL
/// Represents the main sections for Voices.
@Model
class VoicesSection {
    var title: String
    var order: Int
    @Relationship(deleteRule: .cascade) var subsection: [VoicesSubsection] = []

    init(title: String, order: Int, subsections: [VoicesSubsection] = []) {
        self.title = title
        self.order = order
        self.subsection = subsections
    }
}

// MARK: - VOICES SUBSECTION MODEL
/// Represents the subsections within each section.
@Model
class VoicesSubsection {
    var title: String
    var order: Int
    @Relationship(deleteRule: .cascade) var paragraphs: [VoicesText] = []

    init(title: String, order: Int, paragraphs: [VoicesText] = []) {
        self.title = title
        self.order = order
        self.paragraphs = paragraphs
    }
}

// MARK: - VOICES TEXT MODEL
/// Represents text paragraphs with optional images.
@Model
class VoicesText {
    var text: String
    var imageName: String?
    var imageTitle: String?

    init(text: String, imageName: String? = nil, imageTitle: String? = nil) {
        self.text = text
        self.imageName = imageName
        self.imageTitle = imageTitle
    }
}

