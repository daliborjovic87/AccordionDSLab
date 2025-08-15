//
//  ShengItemView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 12. 8. 2025..
//

import SwiftUI

struct ShengItemView: View {
    // MARK: - PROPERTY
    
    let shengIcon: ShengIconModel
    
    // MARK: - BODY
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(systemName: shengIcon.icon.iconName)
                .foregroundStyle(shengIcon.icon.iconcolor)
                .font(.system(size: 45, weight: .bold))
                .frame(width: 45, height: 45)
                .background (
                    RoundedRectangle(cornerRadius: 15)
                        .fill(shengIcon.icon.background)
                        .stroke(Color.black, lineWidth: 1.5)
                        .frame(width: 90, height: 80)
                )
                .shadow(color: .black.opacity(0.5), radius: 3, x: 3, y: 3)
            
            Text(shengIcon.icon.iconTitle)
                .font(.system(size: 15, weight: .bold))
                .foregroundStyle(shengIcon.icon.iconcolor)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(shengIcon.icon.background)
                        .frame(width: 120, height: 25)
                )
                .offset(x: 0, y: 45)
        }
        .contentShape(Rectangle())
    }
}

// MARK: - PREVIEW
#Preview {
    ShengItemView(shengIcon: ShengIconModel(id: 1, icon: .virtualSheng))
}
