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
                    
                    // ACCORDION IN 3 PARTS:
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
                        
                            .padding()
                        
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

