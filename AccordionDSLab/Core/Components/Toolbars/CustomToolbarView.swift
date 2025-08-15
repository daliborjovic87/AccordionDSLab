//
//  CustomToolbarViewView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 22. 4. 2025..
//

import SwiftUI

struct CustomToolbarView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.dismiss) var dismiss
    
    let showDismissButton: Bool
    let title: String
    let customToolbarIcon: String?
    let background: Color
    let fontColor: Color
    
    
    // MARK: - INITIALIZER
    init(title: String, customToolbarIcon: String?, background: Color, fontColor: Color, showDismissButton: Bool = true) {
        self.title = title
        self.customToolbarIcon = customToolbarIcon
        self.background = background
        self.fontColor = fontColor
        self.showDismissButton = showDismissButton
    }

    
    // MARK: - BODY
    
    var body: some View {
        HStack {
            // Displays the button only if `showDismissButton` is true
            if showDismissButton {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward")
                        .foregroundStyle(fontColor)
                        .font(.title2)
                        .fontWeight(.medium)
                }
            } else {
                Spacer() // An empty space for alignment, if there is no button
                    .frame(width: 44, height: 44) // Ista velicina kao i dugme
            }
            
            Spacer()
            
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(fontColor)
                .frame(width: 280)
                .padding(.horizontal, 30)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            if let icon = customToolbarIcon {
                Image(systemName: icon)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(fontColor)
                    .padding(2)
            } else {
                Spacer() // An empty space for alignment, if there is no icon
                    .frame(width: 44, height: 44) // Same size as the button
            }
        }
        .safeAreaPadding(.top, 10)
        .padding(.horizontal)
        .padding(.bottom, 10)
        .background(background)
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - PREVIEW

struct CustomToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            // An example with a button
            CustomToolbarView(title: "Custom Toolbar for all Design and situation", customToolbarIcon: "info.circle", background: .customTeal, fontColor: .customSoftPink, showDismissButton: true)
            // An example without a button
            CustomToolbarView(title: "Custom Toolbar", customToolbarIcon: nil, background: .customTeal, fontColor: .customSoftPink, showDismissButton: false)
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
