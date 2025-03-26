//
//  CategoryGridView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 15. 1. 2025..
//

import SwiftUI

struct CategoryGridView: View {
    
    let rows = [
        GridItem(.fixed(150)),
        GridItem(.fixed(150)) // Visina reda je fiksna na 150 jedinica
    ]
    
    var body: some View {
        LazyHGrid(rows: rows) {
            ForEach(0..<9, id: \.self) { value in
                CategoryItemView()
                    .background(Color.white)
                    .padding(25)
            }
        }
        .scaleEffect(0.8)
    }
}


#Preview {
    CategoryGridView()
}
