//
//  CustomShadowLine.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 20. 3. 2025..
//

import SwiftUI

struct CustomShadowLine: View {
    let color: Color = Color.gray
    let thickness: CGFloat = 2
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: thickness)
            .opacity(0.35)
            .shadow(color: Color.black, radius: 2.5, x: 2, y: 1)
            .shadow(color: Color.black, radius: 5, x: 5, y: 2)
    }
}

struct CustomShadowLine_Previews: PreviewProvider {
    static var previews: some View {
        CustomShadowLine()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
