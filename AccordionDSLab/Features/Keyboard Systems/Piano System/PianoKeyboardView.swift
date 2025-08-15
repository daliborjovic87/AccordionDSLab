//
//  PianoKeyboard.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 22. 7. 2025..
//

import SwiftUI

struct PianoKeyboardView: View {
    // MARK: - PROPERTIES
    let allKeys: [PianoKeyModel] = Key.allCases.map { PianoKeyModel(note: $0) }
    
    // Reference dimensions for scaling
    let referenceWidth: CGFloat = 600
    let referenceHeight: CGFloat = 700
    
    // MARK: - STATE PROPERTIES
    @State private var currentRegister: Register = .clarinet
    @StateObject private var audioController = AudioController.shared
    
    @State private var reverbMix: Float = 0.0
    @State private var delayMix: Float = 0.0
    @State private var delayTime: Float = 0.2
    @State private var delayFeedback: Float = 50.0
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 0) {
            CustomToolbarView(title: "Keyboard".uppercased(), customToolbarIcon: nil, background: .customTeal, fontColor: .customSoftPink)
            CustomDivider(color: .customApricotOrange)
            
            GeometryReader { geo in
                let isLandscape = geo.size.width > geo.size.height
                let widthScaleFactor = geo.size.width / referenceWidth
                let heightScaleFactor = geo.size.height / referenceHeight
                
                let actualScaleFactor = isLandscape ? min(widthScaleFactor, heightScaleFactor) : widthScaleFactor

                VStack(spacing: 40 * actualScaleFactor) {
                    
                    // MARK: - REGISTER SELECTION VIEW
                    HStack {
                        Text("SWITCH VOICE".uppercased())
                            .font(.system(size: 25 * actualScaleFactor))
                            .fontWeight(.black)
                            .padding(15 * actualScaleFactor)
                            .foregroundStyle(Color.customLightBlue)
                            .background(Color.customDarkBrown)
                            .clipShape(RoundedRectangle(cornerRadius: 10 * actualScaleFactor))
                            .shadow(color: .customDarkBrown, radius: 1, x: 1, y: 1)
                            .padding(.top, 10 * actualScaleFactor)
                    }
                    .padding(.bottom, -30 * actualScaleFactor)
                    
                    
                    // MARK: - REGISTER SELECTION VIEW
                    RegisterSelectionView(selectedRegister: $currentRegister,
                                          scaleFactor: actualScaleFactor * 1.2,
                                          isLandscape: isLandscape)
                    .onChange(of: currentRegister, initial: true) { _, newRegister in
                        // Updates the register in the audio controller
                        audioController.currentRegister = newRegister
                    }
                    .frame(height: 180 * actualScaleFactor)
                    .background(
                        RoundedRectangle(cornerRadius: 10 * actualScaleFactor)
                            .fill(Color.customGreenPersian)
                    )
                    
                    // MARK: - KEYBOARD LAYOUT
                    ZStack {
                        // White keys
                        HStack(spacing: 4 * actualScaleFactor) {
                            ForEach(allKeys.filter { $0.note.keyColor == .white }) { key in
                                PianoKeyView(pianoKey: key).environmentObject(audioController)
                                    .environmentObject(audioController)
                            }
                        }
                        .frame(width: 580 * actualScaleFactor, height: 420 * actualScaleFactor)
                        
                        // Black keys
                        HStack(spacing: 21 * actualScaleFactor) {
                            Spacer().frame(width: 0)
                            PianoKeyView(pianoKey: PianoKeyModel(note: .CSharp)).offset(x: 2 * actualScaleFactor, y: -25 * actualScaleFactor)
                                .environmentObject(audioController)
                            
                            Spacer().frame(width: 0)
                            PianoKeyView(pianoKey: PianoKeyModel(note: .DSharp)).offset(x: 12 * actualScaleFactor, y: -25 * actualScaleFactor)
                                .environmentObject(audioController)
                            
                            Spacer(minLength: 15 * actualScaleFactor)
                            
                            Spacer().frame(width: 0)
                            PianoKeyView(pianoKey: PianoKeyModel(note: .FSharp)).offset(x: 19 * actualScaleFactor, y: -25 * actualScaleFactor)
                                .environmentObject(audioController)
                            
                            Spacer().frame(width: 0)
                            PianoKeyView(pianoKey: PianoKeyModel(note: .GSharp)).offset(x: 16 * actualScaleFactor, y: -25 * actualScaleFactor)
                                .environmentObject(audioController)
                            
                            Spacer().frame(width: 0)
                            PianoKeyView(pianoKey: PianoKeyModel(note: .ASharp)).offset(x: 16 * actualScaleFactor, y: -25 * actualScaleFactor)
                                .environmentObject(audioController)
                            
                            Spacer()
                        }
                        .offset(y: -73 * actualScaleFactor)
                        .frame(width: 470 * actualScaleFactor, height: 250 * actualScaleFactor)
                    }
                    .background(
                        Rectangle()
                            .fill(Color.black)
                            .cornerRadius(25 * actualScaleFactor)
                            .frame(width: 580 * actualScaleFactor, height: 480 * actualScaleFactor)
                    )
                    .shadow(color: .black, radius: 12 * actualScaleFactor, x: 5 * actualScaleFactor, y: 5 * actualScaleFactor)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .animation(.easeInOut(duration: 0.3), value: isLandscape)
            }
            .padding(.horizontal, 20)
        }
        .background(SpiralMeshGradient().opacity(0.5))
        .onAppear {
            // Start the audio engine when the view appears
            audioController.startEngine()
        }
        .onDisappear {
            // Stop the audio engine when the view closes
            audioController.stopEngine()
        }
    }
}

// MARK: - PREVIEW
struct PianoKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        PianoKeyboardView()
            .environmentObject(AudioController.shared)
    }
}
