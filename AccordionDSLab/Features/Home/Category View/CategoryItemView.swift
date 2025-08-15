//
//  CategoryItemView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 15. 1. 2025..
//

import SwiftUI

struct CategoryItemView: View {
    // MARK: - PROPERTY
    
    let icon: CategoryIconModel
    
    // MARK: - BODY
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(icon.category.imageName)
                .renderingMode(.template)
                .resizable()
                .foregroundStyle(icon.category.iconColor)
                .scaledToFit()
                .frame(width: 110, height: 110, alignment: .center)
                .rotationEffect(Angle(degrees: 45))
                .background (
                    RoundedRectangle(cornerRadius: 28)
                        .fill(icon.category.background)
                        .stroke(Color.black, lineWidth: 1.5)
                        .frame(width: 148, height: 138)
                )
                .shadow(color: .black.opacity(0.5), radius: 3, x: 3, y: 3)
            
            Text(icon.category.title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(icon.category.background)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(icon.category.iconColor)
                        .frame(width: 155, height: 36)
                )
                .offset(x: 0, y: 55)
        }
        .contentShape(Rectangle())
    }
}

// MARK: - PREVIEW
#Preview {
    CategoryItemView(icon: CategoryIconModel(id: 1, category: .reedBlock))
}
