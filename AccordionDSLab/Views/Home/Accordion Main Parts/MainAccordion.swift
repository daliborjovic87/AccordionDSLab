//
//  MainAccrdion.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 21. 2. 2025..
//


import SwiftUI

struct MainAccordion: View {
    @State private var scaleEffect = false
    @State private var isImageVisible = false
    @State private var leftImageOffset: CGFloat = 0
    @State private var rightImageOffset: CGFloat = 0
    @State private var bellowsOffest: CGFloat = 0
    @State private var leftImageSlide = CGSize(width: -UIScreen.main.bounds.width, height: 0) // Početna pozicija van ekrana
    @State private var rightImageSlide = CGSize(width: UIScreen.main.bounds.width, height: 0)
    @State private var bellowsSlide = CGSize(width: 0, height: -UIScreen.main.bounds.height)
    
    var body: some View {
        
        ZStack {
            HStack(spacing: 0) {
                NavigationLink(value: "TapRightSide") {
                    Image("RightHandSide")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(scaleEffect ? 1.03 : 1)
                        .offset(leftImageSlide)
                        .offset(x: leftImageOffset, y: 0)
                        .animation(.easeInOut(duration: 3), value: leftImageSlide) // Animacija ulaska
                }
                NavigationLink(value: "TapBellows") {
                    Image("Bellows")
                        .resizable()
                        .scaledToFit()
                        .offset(x: 0,y: 1)
                        .offset(bellowsSlide)
                        .animation(.easeInOut(duration: 3), value: bellowsSlide)
                }
                NavigationLink(value: "TapLeftSide") {
                    Image("LeftHandSide")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(scaleEffect ? 1.03 : 1.01)
                        .offset(rightImageSlide)
                        .offset(x: rightImageOffset, y: 0)
                        .offset(x: -2)
                        .animation(.easeInOut(duration: 3), value: rightImageSlide) // Animacija ulaska
                }
            }
            .shadow(color: Color.black.opacity(0.6), radius: 10, x: 12, y: 12)
            //        .rotation3DEffect(Angle(degrees: 0), axis: (x: 5, y: 1, z: 100))
            .frame(width: 180, height: 180)
            .padding(18)
            
            .onAppear {
                isImageVisible = true
                leftImageSlide = .zero // Postavljanje offset-a na 0, što pomera sliku u centar
                rightImageSlide = .zero
                bellowsSlide = .zero
                
                // Odlaganje početka druge animacije
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // Odlaganje za 2 sekunde
                    withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                        scaleEffect = true
                        leftImageOffset = scaleEffect ? -5 : 0
                        rightImageOffset = scaleEffect ? 7 : 0
                    }
                }
            }
            .navigationDestination(for: String.self) { path in
                switch path {
                case "TapRightSide":
                    TapRightSide()
                case "TapBellows":
                    TapBellows()
                case "TapLeftSide":
                    TapLeftSide()
                default:
                    EmptyView()
                }
            }
        }
    }
}


struct MainAccordion_Previews : PreviewProvider {
    static var previews:some View {
        MainAccordion()
    }
}
