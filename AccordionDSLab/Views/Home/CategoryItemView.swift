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
            Image("icon_reed_block")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 110, height: 100, alignment: .center)
                .background (
                    Rectangle()
                        .stroke(Color.colorB4, lineWidth: 2)
                        .frame(width: 148, height: 138)
                )
            
            Text("Reed Block")
                .font(.subheadline)
                .fontWeight(.black)
                .foregroundColor(.white)
                .background(
                    Rectangle()
                        .fill(Color.colorB4)
                        .frame(width: 148, height: 31)
                )
                .offset(x: 0, y: 12)
            
        }
        .contentShape(Rectangle())
        .padding(-2)
        .scaleEffect(0.7)
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
