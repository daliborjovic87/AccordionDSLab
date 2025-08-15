//
//  Key.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 22. 7. 2025..
//

import Foundation
import SwiftUI // Necessary for KeyColor if used in a View, but here it's just for the enum

// MARK: - NOTE ENUM
/// An enumeration that defines all the notes in one octave.
enum Key: String, CaseIterable, Identifiable {
    case C, CSharp, D, DSharp, E, F, FSharp, G, GSharp, A, ASharp, B

    var id: String { self.rawValue }

    // A computed property that returns the key's color.
    var keyColor: KeyColor {
        switch self {
        case .C, .D, .E, .F, .G, .A, .B: return .white
        case .CSharp, .DSharp, .FSharp, .GSharp, .ASharp: return .black
        }
    }
}

// MARK: - KEY COLOR ENUM
/// An enumeration that defines the color of a key.
enum KeyColor {
    case white
    case black
}
