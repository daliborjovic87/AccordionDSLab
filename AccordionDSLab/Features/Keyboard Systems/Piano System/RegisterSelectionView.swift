//
//   RegisterSelectionView.swift
//   AccordionDSLab
//
//   Created by Dalibor Jovic on 24. 7. 2025..
//

import SwiftUI

// MARK: - REGISTER ENUM
/// An enumeration that defines all the accordion registers and their combinations.
/// Each register can be a single base tone or a combination of two, three, or four voices.
enum Register: String, CaseIterable, Identifiable {
    // OSNOVNI REGISTRI (1 glas)
    case bassoon = "Bassoon"
    case clarinet = "Clarinet"
    case soprano = "Soprano"
    case piccolo = "Piccolo"
    
    // 2-VOICE COMBINATION
    case bandoneon = "Bandoneon"
    case organ = "Organ"
    case oboe = "Oboe"
    case saxophone = "Saxophone"
    case horn = "Horn"
    case violin = "Violin"
    
    // 3-VOICE COMBINATION
    case musette = "Musette"
    case accordion = "Accordion"
    case harmonium = "Harmonium"
    case concertino = "Concertino"
    
    // 4-VOICE COMBINATION
    case master = "Master"
    
    var id: String { self.rawValue }

    /// The prefix used to find the audio files.
    var audioPrefix: String {
        return self.rawValue.lowercased()
    }
    
    // MARK: - SOUND COMBINATION LOGIC
    /// Returns an array of base registers that make up the current combination.
    /// This array is used in the `AudioController` to play multiple tones simultaneously.
    
    var soundCombination: [Register] {
        switch self {
        case .bassoon: return [.bassoon]
        case .clarinet: return [.clarinet]
        case .soprano: return [.soprano]
        case .piccolo: return [.piccolo]
            
        case .bandoneon: return [.clarinet, .bassoon]
        case .organ: return [.piccolo, .bassoon]
        case .oboe: return [.clarinet, .piccolo]
        case .saxophone: return [.soprano, .bassoon]
        case .horn: return [.soprano, .piccolo]
        case .violin: return [.clarinet, .soprano]
            
        case .musette: return [.clarinet, .soprano, .piccolo]
        case .accordion: return [.clarinet, .soprano, .bassoon]
        case .harmonium: return [.piccolo, .clarinet, .bassoon]
        case .concertino: return [.piccolo, .soprano, .bassoon]
        case .master: return [.clarinet, .soprano, .piccolo, .bassoon]
        }
    }
    
    // MARK: - IMAGE NAMES
    /// The image name for the register button in its normal state.
    var registerNormal: String {
        switch self {
        case .bassoon: return "register_bassoon_normal"
        case .clarinet: return "register_clarinet_normal"
        case .soprano: return "register_soprano_normal"
        case .piccolo: return "register_piccolo_normal"
            
        case .bandoneon: return "register_bandoneon_normal"
        case .organ: return "register_organ_normal"
        case .oboe: return "register_oboe_normal"
        case .saxophone: return "register_saxophone_normal"
        case .horn: return "register_horn_normal"
        case .violin: return "register_violin_normal"
            
        case .musette: return "register_musette_normal"
        case .accordion: return "register_accordion_normal"
        case .harmonium: return "register_harmonium_normal"
        case .concertino: return "register_concertino_normal"
        case .master: return "register_master_normal"
        }
    }
    
    /// The image name for the register button in its pressed/selected state.
    var registerPressed: String {
        switch self {
        case .bassoon: return "register_bassoon_pressed"
        case .clarinet: return "register_clarinet_pressed"
        case .soprano: return "register_soprano_pressed"
        case .piccolo: return "register_piccolo_pressed"
            
        case .bandoneon: return "register_bandoneon_pressed"
        case .organ: return "register_organ_pressed"
        case .oboe: return "register_oboe_pressed"
        case .saxophone: return "register_saxophone_pressed"
        case .horn: return "register_horn_pressed"
        case .violin: return "register_violin_pressed"
            
        case .musette: return "register_musette_pressed"
        case .accordion: return "register_accordion_pressed"
        case .harmonium: return "register_harmonium_pressed"
        case .concertino: return "register_concertino_pressed"
        case .master: return "register_master_pressed"
        }
    }
}

// MARK: - REGISTER SELECTION VIEW
/// A horizontally scrolling view for selecting the accordion register.
struct RegisterSelectionView: View {
    // MARK: - PROPERTIES
    @Binding var selectedRegister: Register
    
    var scaleFactor: CGFloat
    var isLandscape: Bool

    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 10 * scaleFactor) {
                ForEach(Register.allCases) { register in
                    Button(action: {
                        selectedRegister = register
                    }) {
                        let isSelected = selectedRegister == register
                        let imageName = isSelected ? register.registerPressed : register.registerNormal
                        let textColor = isSelected ? Color.customBackground : Color.customDarkBrown
                        let buttonBackgroundColor = isSelected ? Color.customDarkRed : Color.customSoftPink
                        let shadowColor = isSelected ? Color.customDarkBrown : .clear
                        let strokeColor = isSelected ? Color.white : Color.clear
                        
                        VStack {
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90 * scaleFactor, height: 90 * scaleFactor)
                            
                            Text(register.rawValue)
                                .font(.system(size: 14 * scaleFactor))
                                .fontWeight(.medium)
                                .foregroundColor(textColor)
                        }
                        .padding(.bottom, 5 * scaleFactor)
                        .frame(minWidth: 80 * scaleFactor, minHeight: 70 * scaleFactor)
                        .background(buttonBackgroundColor)
                        .cornerRadius(10 * scaleFactor)
                        .shadow(color: shadowColor, radius: 3 * scaleFactor, x: 3 * scaleFactor, y: 2 * scaleFactor)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10 * scaleFactor)
                                .stroke(strokeColor, lineWidth: 2 * scaleFactor)
                        )
                    }
                }
            }
        }
        .padding(10 * scaleFactor)
    }
}

// MARK: - PREVIEW
struct RegisterSelectionView_Previews: PreviewProvider {
    struct RegisterSelectionViewWrapper: View {
        @State private var selectedRegister: Register = .clarinet
        
        var body: some View {
            RegisterSelectionView(selectedRegister: $selectedRegister, scaleFactor: 0.9, isLandscape: false)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
    
    static var previews: some View {
        RegisterSelectionViewWrapper()
    }
}
