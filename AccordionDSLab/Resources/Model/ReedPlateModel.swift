//
//  FreeReedModel.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 19. 5. 2025..
//

import Foundation
import SwiftData

// MARK: - REED PLATE SECTION MODEL
/// Represents the main sections for the Reed Plate (e.g., 'Construction', 'Functional Principle').
@Model
class ReedPlateSection {
    var title: String
    var order: Int
    @Relationship(deleteRule: .cascade) var subsection: [ReedPlateSubsection] = []

    init(title: String, order: Int, subsections: [ReedPlateSubsection] = []) {
        self.title = title
        self.order = order
        self.subsection = subsections
    }
}

// MARK: - REED PLATE SUBSECTION MODEL
/// Represents the subsections within each section.
@Model
class ReedPlateSubsection {
    var title: String
    var order: Int
    @Relationship(deleteRule: .cascade) var paragraphs: [ReedPlateText] = []

    init(title: String, order: Int, paragraphs: [ReedPlateText] = []) {
        self.title = title
        self.order = order
        self.paragraphs = paragraphs
    }
}

// MARK: - REED PLATE TEXT MODEL
/// Represents text paragraphs with optional images.
@Model
class ReedPlateText {
    var text: String
    var imageName: String?
    var imageTitle: String?

    init(text: String, imageName: String? = nil, imageTitle: String? = nil) {
        self.text = text
        self.imageName = imageName
        self.imageTitle = imageTitle
    }
}

