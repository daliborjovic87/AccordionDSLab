//
//  ShengMainView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 16. 3. 2025..
//

import SwiftData
import SwiftUI

struct ShengMainView: View {
    // MARK: - PROPERTIES
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \ShengSection.order) var sections: [ShengSection]

    // MARK: - BODY
    var body: some View {
        VStack {
            CustomToolbarView(title: "SHENG", customToolbarIcon: nil, background: .customTeal, fontColor: .customSoftPink, showDismissButton: false)

                ShengScrollView()
                    .frame(height: 550)
                    .padding(.top, -25)
                
                
                ShengGridView()
                    .frame(height: 170)
                    .padding(.bottom, 60)
                
                Spacer()
        }
        .background(Color.customGreenPersian)
    }
}

// MARK: - PREVIEW
struct ShengView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShengMainView()
        }
    }
}
