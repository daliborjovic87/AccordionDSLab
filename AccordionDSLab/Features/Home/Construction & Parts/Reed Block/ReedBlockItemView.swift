//
//  ReedBlockItemView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 18. 6. 2025..
//

import SwiftUI

struct ReedBlockItemView: View {
    // MARK: - PROPERTIES
    let title: String
    let description: String
    let iconName: String
    let index: Int
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .trailing, spacing: -15) {
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.customBackground)
                    .padding(12)
                    .shadow(color: .gray, radius: 3, x: 1, y: 1)
                
                Spacer()
                
                Image(systemName: iconName)
                    .foregroundStyle(Color.customLightBlue)
                    .scaledToFit()
                    .scaleEffect(2.5)
                    .frame(width: 80, height: 80)
                    .padding(.horizontal, -6)
            }
            .shadow(color: .customDarkBrown, radius: 1, x: 2, y: 2)
            
            HStack {
                Text(description)
                    .font(.callout)
                    .italic()
                    .foregroundStyle(Color.customDarkRed)
                    .padding(12)
                    .shadow(color: .customGreenPersian, radius: 3, x: 1, y: 1)
                
                Spacer()
            }
        }
        .background(
            SpiralMeshGradient().cornerRadius(15).opacity(0.4)
        )
        .background(Color.customApricotOrange)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding(.horizontal, 10)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(color: .black, radius: 4, x: 1, y: 1)
    }
}

// MARK: - PREVIEW
struct CustomReedBlockRowView_Previews: PreviewProvider {
    static var previews: some View {
        ReedBlockItemView(title: "Classic Construction of Stradella Bass System Reed Blocks", description: "The construction of Stradella bass system reed blocks. The construction of Stradella bass system reed blocks. The construction of Stradella bass system reed blocks", iconName: "info.circle.fill", index: 0)
    }
}
