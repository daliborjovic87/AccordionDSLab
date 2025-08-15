//
//  SpiralMeshGradient.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 21. 2. 2025..
//

import SwiftUI

struct SpiralMeshGradient: View {
    // MARK: - BODY
    var body: some View {
        MeshGradient(
            // Defines the dimensions of a 3x3 grid
            width: 3,
            height: 3,
            // An array of points that control the shape and position of the gradient
            points: [
                .init(0, 0), .init(0.5, 0), .init(1, 0),
                .init(0.5, 1), .init(0.7, 0.5), .init(1, 0.7),
                .init(0, 1), .init(0, 0.5), .init(0, 0.5)],
            // Colors assigned to each point in the grid
            colors: [
                .customTeal, .customMustardYellow, .customBurntOrange,
                .customTeal, .customApricotOrange, .customLightBlue,
                .customLightBlue, .customDarkBrown, .customMustardYellow,
            ]
        )
        // A background color below the gradient with transparency
        .background(Color.customLightBlue.opacity(0.6))
        .ignoresSafeArea()
        // Shadow added for a visual depth effect
        .shadow(color: .colorB, radius: 5 , x: -20, y: 20)
    }
        
}

// MARK: - PREVIEW
#Preview {
    SpiralMeshGradient()
}
