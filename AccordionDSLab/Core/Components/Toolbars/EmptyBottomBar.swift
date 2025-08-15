//
//  EmptyBottomBar.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 26. 4. 2025..
//

import SwiftUI

public struct EmptyBottomBar: View {
    // MARK: - PROPERTIES
    let color: Color
    
    // MARK: - BODY
    public var body: some View {
        Rectangle()
            .fill(color)
            .ignoresSafeArea()
            .frame(height: 15)
    }
}

// MARK: - PREVIEW
struct EmptyBottomBar_Preview: PreviewProvider {
    static var previews: some View {
        EmptyBottomBar(color: .customTeal)
    }
}
