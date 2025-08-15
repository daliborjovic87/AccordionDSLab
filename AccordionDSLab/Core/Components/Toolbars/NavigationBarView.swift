//
//  NavigationBarView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 16. 2. 2025..
//


import SwiftUI

struct NavigationBarView: View {
    // MARK: - PROPERTY
    
    @State private var isAnimated: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        HStack {
            // A placeholder icon for Home
            
            Image(systemName: "house.fill")
                .resizable()
                .foregroundStyle(Color.customApricotOrange)
                .opacity(0.3)
                .frame(width: 35, height: 35)
            
            Spacer()
            
            // Application logo with animation
            LogoView()
                .opacity(isAnimated ? 1 : 0)
                .offset(x: 0, y: isAnimated ? 0 : -25)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 1)) {
                        isAnimated = true
                    }
                })
                .onDisappear(perform: {
                    isAnimated = false
                })
            
            Spacer()
            
            // A placeholder button for the menu
            Button(action: {}, label: {
                Image(systemName: "line.3.horizontal")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.customApricotOrange)
                    .shadow(color: .white, radius: 1, x: 0, y: 0)
            }) //: BUTTON
        }
    }
}

// MARK: - PREVIEW

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
            .previewLayout(.sizeThatFits)
            .frame(width: .infinity, height: 100)
            .background(Color.customTeal)
            .padding()
    }
}
