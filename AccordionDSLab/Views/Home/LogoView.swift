//
//  LogoView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 16. 2. 2025..
//


import SwiftUI

struct LogoView: View {
  var body: some View {
      HStack {
          
      Text("Accordion".uppercased())
        .font(.title3)
        .fontWeight(.black)
        .foregroundColor(.black)
      
      Image("acc_logo")
        .resizable()
        .scaledToFit()
        .scaleEffect(2)
        .frame(width: 35, height: 30, alignment: .center)
      
      Text("DSLab".uppercased())
        .font(.title3)
        .fontWeight(.black)
        .foregroundColor(.black)
    }
  }
}

struct LogoView_Previews: PreviewProvider {
  static var previews: some View {
    LogoView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
