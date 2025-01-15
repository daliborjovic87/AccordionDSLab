//
//  ContentView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 14. 2. 2025..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            VStack(spacing: 0) {
                NavigationBarView()
                    .safeAreaPadding(.top)
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.33), radius: 5, x: 5, y: 5)
                Spacer()
                // MARK: - Categories
                ScrollView {
                    HStack {
                        Text("Categories")
                            .padding(.leading)
                            .font(.title2)
                            .fontWeight(.black)
                            .frame(height: 45)
                        Spacer()
                    }
                    .background(Color.colorB1)
                    .shadow(color: .black.opacity(0.33), radius: 5, x: 5, y: 5)
                    
                    CustomDivider()
                    
                    ScrollView(.horizontal) {
                        CategoryGridView()
                    }
                    .background(Color.colorA4)
                    
                    CustomDivider()
                    
                    VStack {
                        Text("All About accordion")
                        Text("About Author")
                    }
                    
                    Spacer()
                }
            }
        //        .ignoresSafeArea()
        //        .padding(.all)
    }
}

struct ContentView_Previews : PreviewProvider{
    static var previews:some View {
        ContentView ()
    }
}
