//
//  ShengGridIconModel.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 12. 8. 2025..
//

import Foundation
import SwiftUI

// MARK: - ICON MODEL
struct ShengIconModel: Identifiable {
    let id: Int
    let icon: IconSets
}
// MARK: - ICON ENUM
enum IconSets: String, Identifiable, CaseIterable {
    var id: String { self.rawValue}
    
    case history
    case mechanism
    case acoustics
    case timbre
    case anatomy
    case virtualSheng
    
    // icon SF symbols
    var iconName: String {
        switch self {
        case .history: return "book.pages"
        case .mechanism: return "gearshape.2"
        case .acoustics: return "waveform"
        case .timbre: return "music.quarternote.3"
        case .anatomy: return "hammer"
        case .virtualSheng: return "pianokeys.inverse"
        }
    }
    
    var iconTitle: String {
        switch self {
        case .history: return "History"
        case .mechanism: return "Mechanism"
        case .acoustics: return "Acoustics"
        case .timbre: return "Timbre"
        case .anatomy: return "Anatomy"
        case .virtualSheng: return "Virtual Sheng"
        }
    }
    
    // Icon Background Color
    var background: Color {
        switch self {
        case .history: return .customTeal
        case .mechanism: return .customTeal
        case .acoustics: return .customTeal
        case .timbre: return .customTeal
        case .anatomy: return .customTeal
        case .virtualSheng: return .customTeal
        }
    }
    
    // Icon Color
    var iconcolor: Color {
        switch self {
        case .history: return .customBackground
        case .mechanism: return .customBackground
        case .acoustics: return .customBackground
        case .timbre: return .customBackground
        case .anatomy: return .customBackground
        case .virtualSheng: return .customBackground
        }
    }
}
