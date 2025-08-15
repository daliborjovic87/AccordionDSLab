//
//  MainPartsDetail.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 21. 2. 2025..
//

import SwiftUI

// MARK: - MAIN PARTS DETAIL VIEW
struct MainPartsDetailView: View {
    // MARK: - PROPERTIES
    @Environment(\.dismiss) var dismiss
    var mainParts: MainPartsModel
    
    // MARK: - BODY
    var body: some View {
            VStack(spacing: 1) {
                CustomToolbarView(title: mainParts.name, customToolbarIcon: nil, background: .customTeal, fontColor: .customSoftPink).textCase(.uppercase)
                
                CustomDivider(color: .customBurntOrange)

                Spacer()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    // MARK: - DESCRIPTION 1
                    if let attributedText = try? AttributedString(markdown: mainParts.description1) {
                        MarkdownText(attributedText: attributedText)
                    }
                    
                    Spacer(minLength: 20)
                    
                    // MARK: - SCHEMES
                    // Displays an interactive image with zooming and panning
                    ZoomDragImage(image: Image(mainParts.part.schemeImageName))
                        .frame(width: 390, height: 520)
                            .padding(.all, 5)
                            .background(Color.customMustardYellow.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: 22))
                            .overlay(
                                RoundedRectangle(cornerRadius: 22)
                                    .stroke(Color.customMediumGrey, lineWidth: 2)
                                    .shadow(color: Color.customDarkBrown, radius: 5, x: 1, y: 1)
                                    .clipShape(RoundedRectangle(cornerRadius: 22))
                            )
                    
                    // Image title
                    Text(mainParts.imageCaption)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .padding(3)
                    
                    Spacer(minLength: 15)
                    
                    // MARK: - DESCRIPTION 2
                    if let attributedText = try? AttributedString(markdown: mainParts.description2) {
                        MarkdownText(attributedText: attributedText, paragraphSpacing: 7.5)
                    }
                        
                    CustomDivider(color: .customBurntOrange)
                       
                    // MARK: - DESCRIPTION 3
                    if let attributedText = try? AttributedString(markdown: mainParts.description3) {
                        MarkdownText(attributedText: attributedText)
                            .padding(.bottom, 10)
                    }
                    EmptyBottomBar(color: .clear)
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 15)
        }
        .background(SpiralMeshGradient().opacity(0.08))
    }
}

// MARK: - PREVIEW
struct MainPartsView_Previews: PreviewProvider {
    static var previews: some View {
        MainPartsDetailView(mainParts: mainPartsData[1])
    }
}
