//
//  Component.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 15. 1. 2025..
//

import SwiftUI

struct BackgroundOverlay: View {
    let geo: GeometryProxy

    var body: some View {
        Image("background")
            .resizable()
            .scaledToFill()
            .frame(width: geo.size.width, height: geo.size.height)
            .overlay(
                Rectangle()
                    .fill(Color(ColorPalette.mauveDusk)).opacity(0.1)
                    .frame(width: geo.size.width, height: geo.size.height)
            )
            .overlay {
                LinearGradient(stops: [
                    Gradient.Stop(color: .clear, location: 0),
                    Gradient.Stop(color: .mauveDark, location: 0.52),
                    Gradient.Stop(color: .mauveDusk, location: 0.53),
                    Gradient.Stop(color: .clear, location: 1),
                ] , startPoint: .top, endPoint: .bottom)
                .blur(radius: 10)
            }
    }
}

struct BackgroundOverlay_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            BackgroundOverlay(geo: geo)
        }
        .previewLayout(.sizeThatFits)
//        .frame(width: 400, height: 300)
    }
}
