//
//  CustomDivider.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 17. 2. 2025..
//

import SwiftUI

struct CustomDivider: View {
    // MARK: - PROPERTIES
    let color: Color
    let thickness: CGFloat = 2
    
    // MARK: - BODY
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: thickness)
    }
}

// MARK: - PREVIEW
struct CustomDivider_Previews: PreviewProvider {
    static var previews: some View {
        CustomDivider(color: .customApricotOrange)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
