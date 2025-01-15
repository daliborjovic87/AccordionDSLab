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
      Button(action: {}, label: {
        Image(systemName: "magnifyingglass")
          .font(.title)
          .foregroundColor(.black)
      }) //: BUTTON
      
      Spacer()
      
      LogoView()
        .opacity(isAnimated ? 1 : 0)
        .offset(x: 0, y: isAnimated ? 0 : -25)
        .onAppear(perform: {
          withAnimation(.easeOut(duration: 1)) {
            isAnimated.toggle()
          }
        })
      
      Spacer()
      
      Button(action: {}, label: {
          Image(systemName: "line.3.horizontal")
            .font(.title)
            .foregroundColor(.black)
      }) //: BUTTON
    } //: HSTACK
  }
}

// MARK: - PREVIEW

struct NavigationBarView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationBarView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
