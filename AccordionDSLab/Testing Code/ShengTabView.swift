//
//  FeatureTabView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 21. 3. 2025..
//

import SwiftUI

struct ShengTabView: View {
    var body: some View {
        TabView {
            ForEach(shengPhotos) { sheng in
                ShengItemView(shengPhoto: sheng)
                    .frame(width: 330, height: 570)
                    .background(BackgroundLines())
                    .cornerRadius(35)
                    .overlay {
                        RoundedRectangle(cornerRadius: 35, style: .continuous)
                            .stroke(Color.black, lineWidth: 2)
                    }
                    .shadow(color: .gray, radius: 5, x: 15, y: 15)
                    .rotation3DEffect(Angle(degrees: 0), axis: (x: 5, y: 1, z: 100))
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//        .padding(.bottom, 10)
    }
}

struct ShengTabView_Previews: PreviewProvider {
    static var previews: some View {
        ShengTabView()
            .background(colorBackground)
        //      .previewDevice("iPhone 12 Pro")
    }
}
