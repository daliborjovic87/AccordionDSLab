//
//  LogoView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 16. 2. 2025..
//


import SwiftUI

struct LogoView: View {
    
    // MARK: - PROPERTY
    
    @State private var isAnimated: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        HStack (spacing: 10) {
            Text("Accordion".uppercased())
                .font(.largeTitle)
                .fontWeight(.black)
                .fontWidth(.condensed)
                .foregroundStyle(Color.customLightBlue)
                .shadow(color: .customDarkBrown, radius: 1, x: 1, y: 1)
            Image("acc_logo")
                .resizable()
                .scaledToFit()
                .scaleEffect(2)
                .frame(width: 35, height: 30, alignment: .center)
                .shadow(color: .customMustardYellow, radius: 1, x: 0, y: 0)
            
            Text("DSLab".uppercased())
                .font(.largeTitle)
                .fontWeight(.black)
                .fontWidth(.condensed)
                .foregroundStyle(Color.customLightBlue)
                .shadow(color: .customDarkBrown, radius: 1, x: 1, y: 1)
        }
        .padding(.vertical, 5)
    }
}

// MARK: - PREVIEW
struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
            .background(Color.customTeal)
            .padding()
    }
}
