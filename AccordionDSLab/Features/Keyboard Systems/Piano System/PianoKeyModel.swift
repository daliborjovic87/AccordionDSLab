//
//  PianoKeyModel.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 22. 7. 2025..
//

import Foundation

// MARK: - PIANO KEY MODEL
/// A structure representing a single piano key.
struct PianoKeyModel: Identifiable {
    let id = UUID()
    let note: Key
}
