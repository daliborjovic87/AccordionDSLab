//
//  DefaultTextLayout.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 21. 1. 2025..
//

import SwiftUI

struct TextStyle {
    let font: Font
    let color: Color
    let size: CGFloat
    
    init(font: Font = .body, color: Color = .primary, size: CGFloat = 16) {
        self.font = font
        self.color = color
        self.size = size
    }
}

let defaultTextStyle = TextStyle(font: .body, color: .black, size: 14)

