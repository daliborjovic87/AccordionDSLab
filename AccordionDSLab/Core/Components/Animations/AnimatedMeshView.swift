//
//  AnimatedMeshGradient.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 26. 2. 2025..
//
import SwiftUI


struct AnimatedMeshView: View {
    // MARK: - PROPERTIES
    @State var t: Float = 0.0
    @State var timer: Timer?

    // MARK: - BODY
    var body: some View {
        MeshGradient(width: 3, height: 3, points: [
            .init(0, 0), .init(0.5, 0), .init(1, 0),
            
            // Dinamički generisane tačke pomoću sin funkcije
            [sinInRange(-0.8...(-0.2), offset: 0.439, timeScale: 0.342, t: t), sinInRange(0.3...0.7, offset: 3.42, timeScale: 0.984, t: t)],
            [sinInRange(0.1...0.8, offset: 0.239, timeScale: 0.084, t: t), sinInRange(0.2...0.8, offset: 5.21, timeScale: 0.242, t: t)],
            [sinInRange(1.0...1.5, offset: 0.939, timeScale: 0.084, t: t), sinInRange(0.4...0.8, offset: 0.25, timeScale: 0.642, t: t)],
            
            [sinInRange(-0.8...0.0, offset: 1.439, timeScale: 0.442, t: t), sinInRange(1.4...1.9, offset: 3.42, timeScale: 0.984, t: t)],
            [sinInRange(0.3...0.6, offset: 0.339, timeScale: 0.784, t: t), sinInRange(1.0...1.2, offset: 1.22, timeScale: 0.772, t: t)],
            [sinInRange(1.0...1.5, offset: 0.939, timeScale: 0.056, t: t), sinInRange(1.3...1.7, offset: 0.47, timeScale: 0.342, t: t)]
        ], colors: [
            .customMustardYellow, .customTeal, .customMustardYellow,
            .customTeal, .customBackground, .customTeal,
            .customTeal, .customBackground, .customMustardYellow
        ])
        .onAppear {
            // Initializes a timer for changing 't' and starts the animation
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                Task {
                    await MainActor.run {
                        t += 0.02
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
    
    // MARK: - HELPER METHODS

    // A helper function for calculating the sine value within a given range
    func sinInRange(_ range: ClosedRange<Float>, offset: Float, timeScale: Float, t: Float) -> Float {
        let amplitude = (range.upperBound - range.lowerBound) / 1.8
        let midPoint = (range.upperBound + range.lowerBound) / 1.8
        return midPoint + amplitude * sin(timeScale * t + offset)
    }
}

// MARK: - PREVIEW
#Preview {
    AnimatedMeshView()
}
