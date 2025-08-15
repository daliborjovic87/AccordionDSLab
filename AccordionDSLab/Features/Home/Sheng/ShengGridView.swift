//
//  ShengGidView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 18. 3. 2025..
//

import SwiftUI

struct ShengGridView: View {
    // MARK: - PROPERTIES
    let icons: [ShengIconModel] = shengIcon
    
    let rows = [
        GridItem(.fixed(100), spacing: 20),
        GridItem(.fixed(100), spacing: 20)
    ]
    
    // MARK: - BODY
    var body: some View {
        LazyHGrid(rows: rows, spacing: 10) {
            ForEach(icons, id: \.id) { icon in
                NavigationLink(destination: self.destinationView(for: icon.icon)) {
                    ShengItemView(shengIcon: icon)
                        .frame(width: 120, height: 120)
                }
            }
            .transition(.opacity)
            .buttonStyle(PlainButtonStyle())
        }
    }
    
    // MARK: - HELPER METHODS
    
    @ViewBuilder
    private func destinationView(for destination: IconSets) -> some View {
        switch destination {
        case .history:
            ShengDetailView(order: 1, toolbarTitle: IconSets.history.iconTitle, toolbarIcon: IconSets.history.iconName)
        case .mechanism:
            ShengDetailView(order: 2, toolbarTitle: IconSets.mechanism.iconTitle, toolbarIcon: IconSets.mechanism.iconName)
        case .acoustics:
            ShengDetailView(order: 3, toolbarTitle: IconSets.acoustics.iconTitle, toolbarIcon: IconSets.acoustics.iconName)
        case .timbre:
            ShengDetailView(order: 4, toolbarTitle: IconSets.timbre.iconTitle, toolbarIcon: IconSets.timbre.iconName)
        case .anatomy:
            ShengDetailView(order: 5, toolbarTitle: IconSets.anatomy.iconTitle, toolbarIcon: IconSets.anatomy.iconName)
        case .virtualSheng:
            EmptyView()
        }
    }
}

#Preview {
    NavigationView {
        ShengGridView()
    }
}
