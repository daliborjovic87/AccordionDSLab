//
//  ShengView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 16. 3. 2025..
//

import SwiftData
import SwiftUI

struct ShengView: View {
    var body: some View {
        VStack {
            CustomShadowLine()
            
            ShengScrollView()
                .frame(width: .infinity, height: 620)
                .background(colorBackground)
                .padding(.top, 5)
            
            Spacer()
            CustomShadowLine()
                .offset(y: -40)
            
            ShengBottomBarView()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("SHENG")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.black)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
            }
        }
    }
}

struct ShengView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShengView()
        }
    }
}
