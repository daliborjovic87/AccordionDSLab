//
//  CustomDivider.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 17. 2. 2025..
//

import SwiftUI

struct CustomDivider: View {
        let color: Color = Color.colorA4
        let thickness: CGFloat = 2
        
        var body: some View {
            Rectangle()
                .fill(color)
                .frame(height: thickness)
        }
    }

struct CustomDivider_Previews: PreviewProvider {
    static var previews: some View {
        CustomDivider()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
