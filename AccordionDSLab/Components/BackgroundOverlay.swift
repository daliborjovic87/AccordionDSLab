//
//  Component.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 15. 1. 2025..
//

import SwiftUI

struct BackgroundOverlay: View {
    
    var body: some View {
        VStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .opacity(0.5)
                .brightness(0.7)
                .overlay {
                    Rectangle()
                        .fill(Color.colorA5).opacity(0.5)
                }
        }
        .ignoresSafeArea()
    }
}

struct BackgroundOverlay_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundOverlay()
    }
}

