//
//  TestingCode2.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 14. 2. 2025..
//

import SwiftUI
 // OVAJ KOD TREBA DA DRAGUJE SLIKU I ZUMIRA
struct TestingCode2: View {
    @State private var scale: CGFloat = 1.0
    @State private var offset = CGSize.zero
    
    var body: some View {
        Image("LeftSideScheme")
            .resizable()
            .scaledToFit()
            .scaleEffect(scale)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        offset = value.translation
                    })
                    .onEnded({ _ in
                        withAnimation(.easeInOut) {
                            offset = CGSize.zero // Resetiranje pozicije nakon što prestane gesta
                        }
                    })
            )
            .gesture(
                MagnificationGesture()
                    .onChanged({ value in
                        scale = max(1.0, min(value.magnitude, 5)) // Limitiranje faktora uvećanja na između 1 i 5 puta originalne veličine.
                    })
                    // Resetiranje faktora uvećanja nakon što prestane gesta (opcionalno)
                    //.onEnded { _ in scale = 1.0 }
            )
    }
}
#Preview {
    TestingCode2()
}
