//
//  Key+ImageName.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 22. 7. 2025..
//

import SwiftUI // Required for Image

extension Key {
    // MARK: - AUDIO FILENAME HELPER
    /// Returns the name of the audio file for a given key and register.
    /// The file name format is: "key_register.wav" (e.g., "C_clarinet.wav").
    func audioFileName(for register: Register) -> String {
        return "\(self.rawValue)_\(register.audioPrefix)"
    }
    
    // MARK: - IMAGE NAME HELPER
    /// Returns the name of the key image based on its color and state (pressed/normal).
    func imageName(isPressed: Bool) -> String {
        let suffix = isPressed ? "_pressed" : "_normal"
        
        switch self.keyColor {
        case .white:
            return "\(self.rawValue)_pianoKey\(suffix)"
        case .black:
            return "black_pianoKey\(suffix)"
        }
    }
}
