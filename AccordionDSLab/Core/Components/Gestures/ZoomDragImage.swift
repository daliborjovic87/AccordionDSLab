//
//  ZoomDragImage.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 14. 2. 2025..
//

import SwiftUI

struct ZoomDragImage: View {
    // MARK: - PROPERTIES
    
    @State private var scale: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    @State private var initialOffset: CGSize = .zero
    
    let minScale: CGFloat = 1.0
    let maxScale: CGFloat = 3
    let image: Image
    
    // MARK: - BODY
    
    var body: some View {
        GeometryReader { geometry in
            image
                .resizable()
                .scaledToFit()
            // Applies zooming with a central point
                .scaleEffect(scale, anchor: .center)
                .frame(width: geometry.size.width, height: geometry.size.height)
            // Applies the offset
            .offset(offset)
            // Clips the content within the frame
            .clipped()
            
            // MARK: - GESTURES
            
            // Magnification Gesture for zooming
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            // Updates the scale, clamping it between min and max values
                            scale = max(minScale, min(scale * value, maxScale))
                            clampOffset(geometry: geometry)
                        }
                        .onEnded { _ in
                            // The scale is not reset
                        }
                )
            // Drag Gesture for moving the image
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if scale > minScale {
                                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.2)) {
                                    offset = CGSize(
                                        width: initialOffset.width + value.translation.width,
                                        height: initialOffset.height + value.translation.height
                                    )
                                    clampOffset(geometry: geometry)
                                }
                            }
                        }
                        .onEnded { _ in
                            // Stores the last offset for continuous panning
                            initialOffset = offset
                        }
                )
        }
    }
    
    // MARK: - HELPER METHODS
    
    // A method for clamping the offset within the screen boundaries
    private func clampOffset(geometry: GeometryProxy) {
        let imageWidth = geometry.size.width * scale
        let imageHeight = geometry.size.height * scale
        let horizontalLimit = (imageWidth - geometry.size.width) / 2
        let verticalLimit = (imageHeight - geometry.size.height) / 2
        
        if horizontalLimit > 0 {
            offset.width = max(-horizontalLimit, min(horizontalLimit, offset.width))
        } else {
            offset.width = 0
        }
        
        if verticalLimit > 0 {
            offset.height = max(-verticalLimit, min(verticalLimit, offset.height))
        } else {
            offset.height = 0
        }
    }
}

// MARK: - PREVIEW
#Preview {
    ZoomDragImage(image: Image(MainPartsSets.rightHand.schemeImageName))
}
