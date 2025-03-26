//
//  TestingCodeAnimation.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 21. 2. 2025..
//

import SwiftUI

struct BackgroundLines: View {
    var body: some View {
        
        MeshGradient(
            width: 3,
            height: 3,
            points: [
                .init(0, 0), .init(0.5, 0), .init(1, 0),
                .init(0.5, 1), .init(0.7, 0.5), .init(1, 0.7),
                .init(0, 1), .init(0, 0.5), .init(0, 0.5)],
            colors: [
                .colorA3, .colorA2, .indigo,
                .black, .colorA5, .colorA2,
                .colorA2, .red, .colorA1,
            ]
        )
        .background(Color.colorBackground)
        .ignoresSafeArea()
        .shadow(color: .green, radius: 25 , x: -20, y: 20)
    }
        
}

#Preview {
    BackgroundLines()
}

    // Deafult:

/*colors: [
 .teal, .purple, .indigo,
 .purple, .pink, .pink,
 .purple, .red, .purple,
 ]
 */
