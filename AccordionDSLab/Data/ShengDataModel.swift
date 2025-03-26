//
//  ShengModel.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 16. 3. 2025..
//

import Foundation
import SwiftData

@Model
class ShengSections { // Predstavlja odeljke Chapter 4., kao što su "Najstariji instrument", "Konstrukcija" i "Akustičke karakteristike"
    var title: String
    var order: Int
    @Relationship(deleteRule: .cascade) var subsection: [ShengSubsections] = []

    init(title: String, order: Int, subsections: [ShengSubsections] = []) {
        self.title = title
        self.order = order
        self.subsection = subsections
    }
}

@Model
class ShengSubsections { // Predstavlja podnaslove svakog odeljka, kao što su "Poreklo i razvoj sena" ili "Osnovna struktura sena", "Konstrukcija"
    var title: String
    var order: Int
    @Relationship(deleteRule: .cascade) var paragraphs: [ShengText] = []

    init(title: String, order: Int, paragraphs: [ShengText] = []) {
        self.title = title
        self.order = order
        self.paragraphs = paragraphs
    }
}

@Model
class ShengText { // Predstavlja tekst svakog podnaslova i Opciono Sliku vezanu sa sheng
    var text: String
    var imageName: String?

        init(text: String, imageName: String? = nil) {
            self.text = text
            self.imageName = imageName
        }
    }
