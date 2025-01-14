//
//  ContentView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 14. 1. 2025..
//

import SwiftUI

struct ContentView: View {
    
    @State var rightHandSide = false
    @State var bellow = false
    @State var leftHandSide = false
    
    var body: some View {
        
        NavigationStack {
            GeometryReader { geo in
                ZStack {
                    // BACKGROUND IMAGE:
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .overlay(
                            Rectangle()
                                .fill(Color(Constant.blueDusk)).opacity(0.3)
                                .frame(width: geo.size.width, height: geo.size.height)
                        )
                    
                    VStack {
                        Text("ACCORDION DESIGN & SOUND LAB")
                            .shadow(color: .black, radius: 5, x: 2, y: 2)
                            .padding(10)
                            .background(Color(Constant.mauveDark).opacity(1))
                            .cornerRadius(55)
                            .overlay(
                                RoundedRectangle(cornerRadius: 55)
                                    .stroke(Color(Constant.shadowLight))
                            )
                            .shadow(color: Color(Constant.shadowDark), radius: 15, x: 5, y: 5)
                        
                            .padding(.top, 60)
                        
                        // MARK: TAP ON ACCORDION PARTS:
                        HStack(spacing: 0) {
                            NavigationLink(value: "RightHandSide") {
                                    Image("RightHandSide")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: geo.size.width / 2.7, height: geo.size.height / 3)
                                        .shadow(color: Color(Constant.shadowDark), radius: 25, x: 5, y: 5)
                            }
                            
                            Button {
                                bellow.toggle()
                            } label: {
                                Image("Bellow")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width / 8.8, height: geo.size.height / 3)
                                    .offset(x: -3,y: 2)
                                    .shadow(color: Color(Constant.shadowDark), radius: 25, x: 5, y: 5)
                            }
                            
                            Button {
                                leftHandSide.toggle()
                            } label: {
                                Image("LeftHandSide")
                                    .resizable()
                                    .scaledToFit()
                                    .scaleEffect(1.015)
                                    .frame(width: geo.size.width / 5.5, height: geo.size.height / 3)
                                    .offset(x: -6)
                                    .shadow(color: Color(Constant.shadowDark), radius: 25, x: 5, y: 5)
                            }
                        }
                        .frame(width: geo.size.width / 1.3, height: geo.size.height / 2.8)
                        .padding()
                        .background(
                            Color(Constant.mauveDusk).opacity(0.5)
                                .cornerRadius(55)
                        )
                        .padding()
                        
                        ScrollView {
                            Text("Harmonika je veoma kompleksan tehnicki sistem, sa relativno velikim brojem podsklopova, funkcionalinh komponenti i razlicitih delova, koji mora imati veliku pouzdanost, dugotrajnu vremensku postojanost, funkcionalnu ponovljivost i stabilnost mehanickog sistema. Harmonika se sastoji od 3 osnovna dela, koji predstavljaju tri nezavisne celine:")
                            
                            Spacer()
                            
                            Text("• Desna strana, funkcionalno integrisana u okviru desnog polukorspusa(Tap left to see)\n• Meh, koji povezuje desnu i levu stranu (Tap middle to see)\n• Leva strana, funkcionalno integrisana u okviru levog polukorpusa (Tap right to see)")

                        }
                        .font(.system(size: 18))
                        .foregroundColor(Color(Constant.mauveLight))
                        .padding()
                    }
                }
            }
            .ignoresSafeArea()
            .navigationDestination(for: String.self) { path in
                if path == "RightHandSide" {
                    RightHandSide()
                } else {
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

