//
//  ContentView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 14. 1. 2025..
//

import SwiftUI
import UIKit

struct AccordionMainParts: View {
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack {
                    // MARK: - BACKGROUND IMAGE
                    
                    BackgroundOverlay(geo: geo)
                    
                    VStack {
                        Text("The Main Parts of the Accordion")
                            .shadow(color: .black, radius: 5, x: 2, y: 2)
                            .padding(10)
                            .background(.mauveDark.opacity(1))
                            .cornerRadius(55)
                            .overlay(
                                RoundedRectangle(cornerRadius: 55)
                                    .stroke(Color(ColorPalette.mauveLight), lineWidth: 1)
                            )
                            .shadow(color: Color(ColorPalette.shadowDark), radius: 15, x: 5, y: 5)
                        
                            .padding(.top, 60)
                        
                        
                        // MARK: - TAPPABLE ACCORDION IMAGE:
                        
                            HStack(spacing: 0) {
                                NavigationLink(value: "TapRightSide") {
                                    Image("RightHandSide")
                                        .resizable()
                                        .scaledToFit()
                                        .shadow(color: Color(ColorPalette.shadowDark), radius: 25, x: 5, y: 5)
                                }
                                
                                NavigationLink(value: "TapBellows") {
                                    Image("Bellows")
                                        .resizable()
                                        .scaledToFit()
                                        .offset(x: -3,y: 2)
                                        .shadow(color: Color(ColorPalette.shadowDark), radius: 25, x: 5, y: 5)
                                }
                                
                                NavigationLink(value: "TapLeftSide") {
                                    Image("LeftHandSide")
                                        .resizable()
                                        .scaledToFit()
                                        .scaleEffect(1.015)
                                        .offset(x: -6)
                                        .shadow(color: Color(ColorPalette.shadowDark), radius: 25, x: 5, y: 5)
                                }
                            }
                            .rotation3DEffect(Angle(degrees: 90), axis: (x: 5, y: 1, z: 100))
                            .frame(width: geo.size.width / 2.2, height: geo.size.height / 5)
                            .padding(18)
                            .background(
                                Color(.blueLight).opacity(0.2)
                                    .cornerRadius(35)
                            )
                            .padding()
                        
                    // MARK: - TEXT ABOUT ACCORDION MAIN PARTS
                        
                        ScrollView {
                            JustifiedTextView(text: "Harmonika je veoma kompleksan tehnicki sistem, sa relativno velikim brojem podsklopova, funkcionalinh komponenti i razlicitih delova, koji mora imati veliku pouzdanost, dugotrajnu vremensku postojanost, funkcionalnu ponovljivost i stabilnost mehanickog sistema. Harmonika se sastoji od 3 osnovna dela, koji predstavljaju tri nezavisne celine: \n\n• Desna strana, funkcionalno integrisana u okviru desnog polukorspusa(Tap left to see)\n• Meh, koji povezuje desnu i levu stranu (Tap middle to see)\n• Leva strana, funkcionalno integrisana u okviru levog polukorpusa (Tap right to see)")
                            .frame(width: geo.size.width / 1.1, height: geo.size.height)
                        }
                        .padding(-10)
                        .shadow(color: Color(ColorPalette.shadowDark), radius: 10, x: 5, y: 5)
                            
                    }
                    .padding(.bottom, 10)
                }
            }
            .ignoresSafeArea()
            
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

#Preview {
    AccordionMainParts()
}

