//
//  TabView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 14. 1. 2025..
//

import SwiftUI

struct TabsView: View {
    var body: some View {
        TabView {
            // Tab 1: Desna strana
            VStack(alignment: .leading) {
                Text("Desna strana")
                    .font(.headline)
                Text("Funkcionalno integrisana u okviru desnog polukorpusa.")
                    .italic()
                Image(systemName: "house")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            .tabItem {
                Label("Desna strana", systemImage: "house")
            }
        }
        
    }
}

#Preview {
    TabsView()
}
