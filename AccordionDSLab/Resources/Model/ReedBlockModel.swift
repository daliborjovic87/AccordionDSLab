//
//  ReedBlockModel.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 18. 6. 2025..
//

import Foundation
import SwiftData

// MARK: - REED BLOCK SECTION MODEL
/// Represents the main sections for the Reed Block (e.g., 'Construction', 'Functional Principle').
@Model
class ReedBlockSection {
    var title: String
    var order: Int
    @Relationship(deleteRule: .cascade) var subsection: [ReedBlockSubsection] = []

    init(title: String, order: Int, subsections: [ReedBlockSubsection] = []) {
        self.title = title
        self.order = order
        self.subsection = subsections
    }
}

// MARK: - REED BLOCK SUBSECTION MODEL
/// Represents the subtitles within each section.
@Model
class ReedBlockSubsection {
    var title: String
    var order: Int
    @Relationship(deleteRule: .cascade) var paragraphs: [ReedBlockText] = []

    init(title: String, order: Int, paragraphs: [ReedBlockText] = []) {
        self.title = title
        self.order = order
        self.paragraphs = paragraphs
    }
}

// MARK: - REED BLOCK TEXT MODEL
/// Represents text paragraphs with optional images.
@Model
class ReedBlockText {
    var text: String
    var imageName: String?
    var imageTitle: String?

    init(text: String, imageName: String? = nil, imageTitle: String? = nil) {
        self.text = text
        self.imageName = imageName
        self.imageTitle = imageTitle
    }
}
