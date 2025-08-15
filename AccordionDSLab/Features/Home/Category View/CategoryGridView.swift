//
//  CategoryGridView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 15. 1. 2025..
//

import SwiftUI

struct CategoryGridView: View {
    // MARK: - PROPERTIES
    let icons: [CategoryIconModel] = categoryIcon
    
    let rows = [
        GridItem(.fixed(180), spacing: 30),
        GridItem(.fixed(180), spacing: 30)
    ]

    // MARK: - BODY
    var body: some View {
        LazyHGrid(rows: rows, spacing: 20) {
            ForEach(icons, id: \.id) { icon in
                // A private method is used to generate the destination
                NavigationLink(destination: self.destinationView(for: icon.category)) {
                    CategoryItemView(icon: icon)
                        .frame(width: 148, height: 120)
                }
                .transition(.slide)
                .buttonStyle(PlainButtonStyle())
            }
        }
        .scaleEffect(0.85)
    }
    
    // MARK: - HELPER METHODS
    
        /// Creates and returns the appropriate View based on the selected category.
        /// This is a private method within `CategoryGridView`
    @ViewBuilder
    private func destinationView(for destination: CategorySets) -> some View {
        switch destination {
        case .reedPlate:
            ReedPlateListView()
        case .reedBlock:
            ReedBlockListView()
        case .keyboard:
            PianoKeyboardView()
        case .valvePallet:
            EmptyView()
        case .voices:
            EmptyView() // Placeholder
        case .register:
            EmptyView() // Placeholder
        }
    }
}

// MARK: - PREVIEW
#Preview {
    NavigationView {
        CategoryGridView()
    }
}
