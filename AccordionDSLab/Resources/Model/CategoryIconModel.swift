//
//  CostructionIconModel.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 15. 6. 2025..
//

import Foundation
import SwiftUI

// MARK: - ICON MODEL
struct CategoryIconModel: Identifiable {
    let id: Int
    let category: CategorySets
}

// MARK: - CATEGORY ENUM
enum CategorySets: String, Identifiable, CaseIterable {
    var id: String { self.rawValue } // Conformance to Identifiable, needed for the ForEach loop
    
    case reedPlate
    case reedBlock
    case keyboard
    case valvePallet
    case voices
    case register
    
    // String name from Assets
    var imageName: String {
        switch self {
        case .reedPlate: return "reed_plate_icon"
        case .reedBlock: return "reed_block_icon"
        case .keyboard: return "keyboard_icon"
        case .valvePallet: return "valve_pallet_icon"
        case .voices: return "voices_icon"
        case .register: return "register_icon"
        }
    }
    
    // Icon Title
    var title: String {
        switch self {
        case .reedPlate: return "Reed Plate"
        case .reedBlock: return "Reed Block"
        case .keyboard: return "Keyboard"
        case .valvePallet: return "Valve Pallet"
        case .voices: return "Voices"
        case .register: return "Register"
        }
    }
    
    // Icon Background Color
    var background: Color {
        switch self {
        case .reedPlate: return .customApricotOrange
        case .reedBlock: return .customTeal
        case .keyboard: return .customBurntOrange
        case .valvePallet: return .customGreenPersian
        case .voices: return .customSoftPink
        case .register: return .customMustardYellow
        }
    }
    
    // Icon Color
    var iconColor: Color {
        switch self {
        case .reedPlate: return .customTeal
        case .reedBlock: return .customSoftPink
        case .keyboard: return .customDarkRed
        case .valvePallet: return .customDarkBrown
        case .voices: return .customDarkBrown
        case .register: return .customMediumGrey
        }
    }
}
