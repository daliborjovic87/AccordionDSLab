//
//  LeftSide.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 15. 1. 2025..
//

import SwiftUI

struct TapLeftSide: View {
    @State private var mainParts: [MainPartsModel] = []
    
    @State private var scale: CGFloat = 1.0
    @State private var offset = CGSize.zero
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("Scheme of left side")
                
                Image("LeftSideScheme")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(width: geo.size.width / 1, height: geo.size.height / 1.5)
                    .padding(.top, 20)
                    .overlay(
                Rectangle()
                    .stroke(lineWidth: 2)
                    .frame(width: 350, height: 550)
                )
                    .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            scale = max(1.0, min(value.magnitude, 5)) // Limitiranje faktora uvećanja na između 1 i 5 puta originalne veličine.
                        }
                        // Resetiranje faktora uvećanja nakon što prestane gesta (opcionalno)
                        //.onEnded { _ in scale = 1.0 }
                )
                    .padding()
                    
                
                    ForEach(mainParts) { part in
                        VStack(alignment: .leading) {
                            Text(part.name)
                                .font(.headline)
                            Text(part.description)
                                .padding(.bottom, 10)
                            
                            ScrollView(.horizontal) {
                                HStack(spacing: 20) {
                                    ForEach(part.bullets, id: \.self) { bullet in
                                        Text(bullet)
                                            .padding()
                                            // Dodajte stil kako želite (npr., boja pozadine, tekst itd.)
                                            .background(Color.blue.opacity(0.2))
                                            .cornerRadius(8)
                                    }
                                }
                            }
                        }
                        Spacer().frame(height: 30)
                    }
            }
        }
        // Pozovite funkciju kada se view pojavi na ekranu
        .onAppear(perform: decodeMainParts)

    }

    private func decodeMainParts() {
        if let url = Bundle.main.url(forResource: "mainparts", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                mainParts = try decoder.decode([MainPartsModel].self, from: data)
                
            } catch {
                print("Error decoding JSON data:\(error)")
            }
        } else {
            print("Failed to locate the file.")
        }

    }

}

struct TapLeftSide_Previews: PreviewProvider {
    
    static var previews : some View{
        return TapLeftSide()
        
    }
}
