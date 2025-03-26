//
//  ScrollTransition Testing.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 22. 3. 2025..
//

import SwiftUI

struct ShengScrollView: View {
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(shengPhotos) { sheng in
                            ShengItemView(shengPhoto: sheng)
                                .scrollTransition(
                                    axis: .horizontal
                                ) { content, phase in
                                    return content
                                        .offset(x: phase.value * -380)
                                }
                                .frame(width: geometry.size.width - 50, height: 570) // Prilagođavamo širinu
                                .background(BackgroundLines())
                                .cornerRadius(35)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 35, style: .continuous)
                                        .stroke(Color.black, lineWidth: 1.5)
                                }
                                .shadow(color: .black, radius: 5, x: 5, y: 5)
                                .frame(width: geometry.size.width) // Centriramo sliku
                    }
                }
            }
            .scrollTargetBehavior(.paging)
        }
    }
}

struct ScrollTransition_Previews: PreviewProvider {
    static var previews: some View {
        ShengScrollView()
    }
}
