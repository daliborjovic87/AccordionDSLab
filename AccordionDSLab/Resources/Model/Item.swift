//
//  Item.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 19. 6. 2025..
//

import Foundation

// MARK: - LIST ITEM MODEL
/// A model used for navigation in lists (e.g., ReedPlateListView and ReedBlockListView).
struct Item: Identifiable, Hashable {
    let id = UUID() // Requires Identifiable
    let title: String
    let content: String
    let sectionOrder: Int?
    let icon: String
}
