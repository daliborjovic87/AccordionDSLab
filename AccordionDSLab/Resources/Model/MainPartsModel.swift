//
//  MainParts.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 11. 2. 2025..
//

import Foundation
import SwiftData

// MARK: - MAIN PARTS ENUM
/// Enum for defining the main parts of the accordion.
enum MainPartsSets: String, Codable, CaseIterable, Identifiable, Hashable {
    var id: String { self.rawValue }
    
    case leftHand
    case bellows
    case rightHand
    
    var title: String {
        switch self {
        case .leftHand: return "Left-Hand Side"
        case .bellows: return "Bellows - Air Chamber"
        case .rightHand: return "Right-Hand Side"
        }
    }
    
    var animationImage: String {
        switch self {
        case .leftHand: return "animation_left_hand_side"
        case .bellows: return "animation_bellows_side"
        case .rightHand: return "animation_right_hand_side"
        }
    }
    
    var schemeImageName: String {
        switch self {
        case .leftHand: return "left_side_scheme"
        case .bellows: return "bellows_side_scheme"
        case .rightHand: return "right_side_scheme"
        }
    }
}

// MARK: - SWIFTDATA MODEL
/// A model for data persistence about the main parts.
@Model
class MainPartsModel {
    var part: MainPartsSets
    var description1: String
    var description2: String
    var description3: String
    var imageCaption: String
    
    // Computed properties that are extracted from the `part` enum.
    var name: String {
        return self.part.title
    }
    
    var schemeImage: String {
        return self.part.schemeImageName
    }
    
    init(part: MainPartsSets, description1: String, description2: String, description3: String, imageCaption: String) {
        self.part = part
        self.description1 = description1
        self.description2 = description2
        self.description3 = description3
        self.imageCaption = imageCaption
    }
}
