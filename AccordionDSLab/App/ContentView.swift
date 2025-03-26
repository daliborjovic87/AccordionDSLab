//
//  ContentView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 14. 2. 2025..
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    let startDate = Date()
    
    var body: some View {
        NavigationStack {
            ZStack {
                //                AnimatedMeshView().opacity(0.7)
                VStack(spacing: 0) {
                    NavigationBarView()
                        .safeAreaPadding(.top, 10)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                    Spacer()
                    
                    // MARK: - TAPPABLE ACCORDION WITH ANIMATION
                    ScrollView {
                        MainAccordion()
                        
                        // MARK: - CONSTRUCTION & PARTS
                        HStack {
                            Text("Construction & Parts")
                                .padding(.leading)
                                .font(.system(size: 22, weight: .semibold))
                                .overlay(
                                    Text("Construction & Parts")
                                        .padding(.leading)
                                        .font(.system(size: 22, weight: .semibold))
                                        .foregroundColor(.white) // Unutrašnja boja teksta
                                        .shadow(color: Color.black, radius: 1, x: 0.5, y: 0.5) // Senka teksta
                                )
                                .fontWeight(.black)
                                .frame(height: 45)
                            
                            Spacer()
                        }
                        .background(Color.colorA3)
                        .shadow(color: .black.opacity(0.7), radius: 4, x: 2, y: 4)
                        Spacer(minLength: 1)
                        
                        // MARK: - CATEGORIES SCROLL VIEW:
                        ScrollView(.horizontal) {
                            CategoryGridView()
                                .frame(height: 270)
                                .padding(.leading, -72)
                                .shadow(color: .black.opacity(0.25), radius: 3, x: 5, y: 5)
                        }
                        .background(Color.colorA1)
                        
                        
                        CustomDivider()
                        
                        NavigationLink("SHENG") {
                            ShengView()
                        }
                        
                        VStack {
                            Text("All About accordion")
                            Text("About Author")
                            TimelineView(.animation) { context in
                                Image(systemName: "touchid")
                                    .font(.system(size: 200).weight(.heavy))
                                    .foregroundColor(.blue)
                                    .layerEffect(ShaderLibrary.emboss(.float(2)), maxSampleOffset: .zero)
                                    .visualEffect { content, proxy in
                                        content
                                            .distortionEffect(ShaderLibrary.complexWave(
                                                .float(startDate.timeIntervalSinceNow),
                                                .float2(proxy.size),
                                                .float(0.5),
                                                .float(8),
                                                .float(10)
                                            ), maxSampleOffset: CGSize(width: 100, height: 100))
                                    }
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
            //            .background(Color.colorA4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews:some View {
        ContentView()
            .modelContainer(for: ShengSections.self, inMemory: true)
    }
}
