//
//  ReedPlateItemView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 5. 5. 2025..
//
import SwiftUI

struct ReedPlateItemView: View {
    // MARK: - PROPERTIES
    let title: String
    let description: String
    let iconName: String
    let backgroundColor: Color = .customTeal
    let frontColor: Color = .customBackground
    let index: Int
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: iconName)
                .foregroundStyle(frontColor)
                .font(.title)
                .frame(width: 40)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundStyle(frontColor)
                    .padding(1)
                Text(description)
                    .font(.title3)
                    .italic()
                    .fontWeight(.thin)
                    .foregroundStyle(frontColor)
            }
                            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.title2)
                .foregroundStyle(frontColor)
        }
        .shadow(color: .customDarkBrown, radius: 1, x: 2, y: 2)
        .padding(10)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .customDarkBrown, radius: 2, x: 0, y: 0)
    }
}

// MARK: - PREVIEW
struct CustomReedPlateRowView_Previews: PreviewProvider {
    static var previews: some View {
        ReedPlateItemView(title: "Introduction", description: "About something", iconName: "info.circle.fill", index: 0)
    }
}
