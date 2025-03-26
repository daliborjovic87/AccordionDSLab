//
//  CategoryGridItem.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 15. 1. 2025..
//

import SwiftUI

struct CategoryItemView: View {
    // MARK: - PROPERTY
    
    //  let category: Category
    
    // MARK: - BODY
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            Image("icon_reg_right")
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .scaleEffect(0.8)
                .offset(y: -10)
                .frame(width: 110, height: 110, alignment: .center) // 110 110
                .background (
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.colorA4)
                        .stroke(Color.colorA3, lineWidth: 1.5)
                        .frame(width: 148, height: 138) // 148 138
                )
            
            Text("Reed Block")
                .font(.subheadline)
                .fontWeight(.black)
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.colorA3)
                        .frame(width: 148, height: 31)
//                        .cornerRadius(3)
                )
                .offset(x: 0, y: 8)
            
        }
        .contentShape(Rectangle())
//        .padding(-2)
//        .scaleEffect(0.7)
        .onTapGesture {
            print("kliknuo")
        }
    }
}

// MARK: - PREVIEW

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background()
    }
}
