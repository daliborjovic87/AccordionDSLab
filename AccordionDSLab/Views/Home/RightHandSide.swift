//
//  AccordionModelView.swift
//  AccordionLab
//
//  Created by Dalibor Jovic on 11. 1. 2025..
//

import SwiftUI

struct RightHandSide: View {
    var body: some View {
        
        GeometryReader { geo in 
            ZStack {
                
                VStack {
                    // ACCORDION TEXT:
                    Text("Accordion model:")
                    
                    // ACCORDION IMAGES DESIGN:
                    Image("bugari-piano-balkandm")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .black, radius: 5, x: 2, y: 2)
                        .frame(width: geo.size.width / 1.7, height: geo.size.height / 4)
                        .padding(10)
                        .background(Color(Constant.mauveDark).opacity(1))
                        .cornerRadius(55)
                        .overlay(
                            RoundedRectangle(cornerRadius: 55)
                                .stroke(Color(Constant.shadowLight))
                        )
                        .shadow(color: Color(Constant.shadowDark), radius: 15, x: 5, y: 5)
                    
                    Text("Bugari Balkan DM")
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    RightHandSide()
}
