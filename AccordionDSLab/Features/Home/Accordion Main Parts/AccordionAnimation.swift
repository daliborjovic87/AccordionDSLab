//
//  MainAccrdion.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 21. 2. 2025..
//

import SwiftUI

// MARK: - NAVIGATION ENUM
enum MainPartsNavigation: String, Hashable {
    case rightHand, bellows, leftHand
}

struct AccordionAnimation: View {
    // MARK: - PROPERTIES
    let startDate = Date()
    
    // MARK: - STATE PROPERTIES
    @State private var scaleEffect = false
    @State private var scaleInfoButton = false
    @State private var opacityEffect = false
    @State private var leftImageOffset: CGFloat = 0
    @State private var rightImageOffset: CGFloat = 0
    @State private var leftImageSlide = CGSize(width: -UIScreen.main.bounds.width, height: 0)
    @State private var rightImageSlide = CGSize(width: UIScreen.main.bounds.width, height: 0)
    @State private var showInfo = false
    @State private var infoButtonHide = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack {
                // MARK: - "THE MAIN PARTS" LAYOUT
                HStack {
                    Text("Main Parts of the Accordion".uppercased())
                        .font(.title2)
                        .fontWeight(.bold)
                        .fontWidth(.condensed)
                        .foregroundStyle(Color.customLightBlue)
                        .frame(height: 45)
                        .shadow(color: .customTeal.opacity(0.5), radius: 1, x: 2, y: 2)
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
                .background(Color.customGreenPersian)
                
                Spacer()
                
                // MARK: - INFO BUTTON LAYOUT
                HStack {
                    Button {
                        showInfo = true
                    } label: {
                        Image(systemName: "info.bubble.fill")
                            .font(.system(size: 30))
                            .opacity(0.8)
                            .foregroundStyle(Color.customLightBlue)
                            .scaleEffect(scaleInfoButton ? 1 : 0)
                            .animation(.easeInOut(duration: 2), value: scaleInfoButton)
                            .opacity(opacityEffect ? 1 : 0)
                            .animation(.easeInOut(duration: 4), value: opacityEffect)
                            .opacity(infoButtonHide ? 0 : 1)
                            .symbolEffect(.wiggle, options: .repeat(.periodic(delay: 4)))
                    }
                }
                
                // MARK: - ANIMATION OF ACCORDION
                HStack(spacing: 0) {
                    // RIGHT SIDE OF ACCORDION
                    NavigationLink(value: MainPartsNavigation.rightHand) {
                        Image(MainPartsSets.rightHand.animationImage)
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(scaleEffect ? 1.03 : 1)
                            .offset(leftImageSlide)
                            .opacity(opacityEffect ? 1 : 0)
                            .animation(.easeInOut(duration: 2.5), value: opacityEffect)
                            .animation(.easeInOut(duration: 3), value: leftImageSlide)
                            .offset(x: leftImageOffset, y: 0)
                            .contentShape(Rectangle())
                    }
                    // BELLOWS
                    NavigationLink(value: MainPartsNavigation.bellows) {
                        Image(MainPartsSets.bellows.animationImage)
                            .resizable()
                            .scaledToFit()
                            .offset(x: 0,y: 1)
                            .opacity(opacityEffect ? 1 : 0)
                            .animation(.easeInOut(duration: 3.1), value: opacityEffect)
                            .contentShape(Rectangle())
                    }
                    // LEFT SIDE ACCORDION
                    NavigationLink(value: MainPartsNavigation.leftHand) {
                        Image(MainPartsSets.leftHand.animationImage)
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(scaleEffect ? 1.03 : 1.01)
                            .opacity(opacityEffect ? 1 : 0)
                            .offset(rightImageSlide)
                            .offset(x: rightImageOffset, y: 0)
                            .offset(x: -2)
                            .animation(.easeInOut(duration: 3), value: rightImageSlide)
                            .animation(.easeInOut(duration: 2.5), value: opacityEffect)
                            .contentShape(Rectangle())
                    }
                }
                
                .shadow(color: Color.customDarkBrown, radius: 1, x: 1, y: 1)
                .frame(width: 180, height: 180)
                
                Spacer()
                Spacer()
                
            }
            
            // MARK: - INFO BUTTON POPUP LAYOUT
            if showInfo {
                VStack(alignment: .center, spacing: 5) {
                    Image(systemName: "arrow.uturn.backward.square")
                        .font(.system(size: 30))
                        .foregroundColor(.black).opacity(0.6)
                        .symbolEffect(.bounce, options: .speed(0.2))
                    
                    // Using `MarkdownText` to display formatted text.
                    MarkdownText(attributedText: """
    The accordion is a complex technical system requiring high reliability and durability. It consists of three basic, independent functional units:
    
    • The right-hand manual (or treble manual),
    • The left-hand manual (or bass manual), and
    • The bellows.
    
    These three units, along with numerous subassemblies and components, constitute a stable mechanical system.
    """, baseFontSize: 16)
                }
                .frame(height: 260)
                .padding(.horizontal, 5)
                .shadow(radius: 1)
                .background(Color.customLightBlue.opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                .onTapGesture {
                    showInfo = false
                    infoButtonHide = false
                }
                .transition(.opacity)
                .onAppear {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) { }
                    infoButtonHide = true
                }
            }
        }
        .frame(height: 350)
        .background {
            Image("table7")
                .resizable()
            AnimatedMeshView().opacity(0.4)
                .frame(height: 240)
                .offset(y: -56)
            Rectangle()
                .fill(Color.customApricotOrange)
                .opacity(0.3)
                .frame(height: 310)
                .offset(y: 20)
        }
        
        // MARK: - ANIMATION TRIGGERS
        .onAppear {
            leftImageSlide = .zero
            rightImageSlide = .zero
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeInOut(duration: 2)) {
                    opacityEffect = true
                    scaleInfoButton = true
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                withAnimation(.easeInOut(duration: 1.3).repeatForever(autoreverses: true)) {
                    scaleEffect = true
                    leftImageOffset = scaleEffect ? -5 : 0
                    rightImageOffset = scaleEffect ? 7 : 0
                }
            }
        }
        // NAVIGATION DESTINATION MODIFIER
        .navigationDestination(for: MainPartsNavigation.self) { part in
            buildMainPartsDetailView(for: part)
        }
    }
    
    // MARK: - HELPER VIEWS
    @ViewBuilder
    func buildMainPartsDetailView(for part: MainPartsNavigation) -> some View {
        if let model = mainPartsData.first(where: { $0.part.rawValue == part.rawValue }) {
            MainPartsDetailView(mainParts: model)
                .transition(
                    .asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .move(edge: .leading)
                    )
                )
        } else {
            EmptyView()
        }
    }
}

// MARK: - PREVIEW
struct AccordionAnimation_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AccordionAnimation()
        }
    }
}
