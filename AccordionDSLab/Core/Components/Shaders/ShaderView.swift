//
//  ShaderView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 15. 7. 2025..
//

import SwiftUI

struct ShaderView: View {
    
    var startDate = Date()
    
    var body: some View {
        VStack {
            TimelineView(.animation) { context in
                Image(systemName: "house.fill")
                    .font(.system(size: 35).weight(.light))
                    .frame(width: 35, height: 35)
                    .foregroundColor(Color.customApricotOrange)
                    .layerEffect(ShaderLibrary.emboss(.float(2)), maxSampleOffset: .zero)
                    .visualEffect { content, proxy in
                        content
                            .distortionEffect(ShaderLibrary.complexWave(
                                .float(startDate.timeIntervalSinceNow),
                                .float2(proxy.size),
                                .float(0.3),
                                .float(1.5),
                                .float(6)
                            ), maxSampleOffset: CGSize(width: 100, height: 100))
                    }
            }
        }
    }
}

#Preview {
    ShaderView()
}
