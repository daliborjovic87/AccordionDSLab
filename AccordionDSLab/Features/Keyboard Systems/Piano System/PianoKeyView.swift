//
//  PianoKeyview.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 22. 7. 2025..
//

import SwiftUI

struct PianoKeyView: View {
    // MARK: - PROPERTIES
    let pianoKey: PianoKeyModel
    @State private var isPressed: Bool = false
    
    // Access the shared AudioController instance
    @EnvironmentObject var audioController: AudioController
    
    // MARK: - BODY
    var body: some View {
        Image(pianoKey.note.imageName(isPressed: isPressed))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        if !isPressed {
                            isPressed = true
                            // Play the note when the key is pressed.
                            audioController.playNote(key: pianoKey.note)
                        }
                    }
                    .onEnded { _ in
                        isPressed = false
                        // Stop the note when the key is released.
                        audioController.stopNote(key: pianoKey.note)
                    }
            )
    }
}

// MARK: - PREVIEW
struct PianoKeyView_Previews: PreviewProvider {
    static var previews: some View {
        PianoKeyView(pianoKey: PianoKeyModel(note: .C))
            .environmentObject(AudioController.shared)
            .previewLayout(.sizeThatFits)
    }
}
