//
//  ShengDataModel.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 16. 3. 2025..
//

import Foundation
import SwiftData

// MARK: - SHENG SECTION MODEL
/// Represents the main sections for the Sheng.
@Model
class ShengSection {
    var title: String
    var order: Int
    @Relationship(deleteRule: .cascade) var subsection: [ShengSubsection] = []

    init(title: String, order: Int, subsections: [ShengSubsection] = []) {
        self.title = title
        self.order = order
        self.subsection = subsections
    }
}

// MARK: - SHENG SUBSECTION MODEL
/// Represents the subsections within each section.
@Model
class ShengSubsection {
    var title: String
    var order: Int
    @Relationship(deleteRule: .cascade) var paragraphs: [ShengText] = []

    init(title: String, order: Int, paragraphs: [ShengText] = []) {
        self.title = title
        self.order = order
        self.paragraphs = paragraphs
    }
}

// MARK: - SHENG TEXT MODEL
/// Represents text paragraphs with optional images.
@Model
class ShengText {
    var text: String
    var imageName: String?
    var imageTitle: String?
    
    init(text: String, imageName: String? = nil, imageTitle: String? = nil) {
        self.text = text
        self.imageName = imageName
        self.imageTitle = imageTitle
    }
}
