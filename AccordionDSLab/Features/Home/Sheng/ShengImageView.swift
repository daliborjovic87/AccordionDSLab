//
//  ShengItemView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 21. 3. 2025..
//

import SwiftUI

struct ShengImageView: View {
  // MARK: - PROPERTY
  
  let shengPhoto: ShengImageModel
  
  // MARK: - BODY
  
  var body: some View {
    Image(shengPhoto.image)
      .resizable()
      .scaledToFill()
      .shadow(color: .black, radius: 5, x: 5, y: 5)
  }
}

// MARK: - PREVIEW
struct ShengItemView_Previews: PreviewProvider {
  static var previews: some View {
      ShengImageView(shengPhoto: shengPhotos[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
