//
//  ShengBasicInfo.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 26. 3. 2025..
//

import SwiftUI
import SwiftData

struct ShengInfo: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \ShengSections.order) private var sections: [ShengSections]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                if let najstarijiInstrument = sections.first(where: { $0.order == 1 } ) {
                    Text(najstarijiInstrument.title)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    
                    ForEach(najstarijiInstrument.subsection) { subsection in
                        Text(subsection.title)
                            .font(.headline)
                        
                    ForEach(subsection.paragraphs.indices, id: \.self) { index in
                        Text(subsection.paragraphs[index].text)
                            .padding(.bottom, 5) //

                        if index == 1 { // Ubacuje sliku nakon drugog paragrafa (indeks 1)
                            Image("bugari-piano-balkandm")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 10)
                        }
                    }
                }
            } else {
                    Text("Nema sekcije sa order 1.")
                }
            }
        }
        .onAppear {
            populateData()
        }
    }
    
    private func populateData() {
        ShengData.populate(modelContext: modelContext)
    }
}

struct ShengInfo_previews: PreviewProvider {
    static var previews: some View {
        ShengInfo()
            .modelContainer(for: ShengSections.self, inMemory: true)
    }
}

/*
 ScrollView {
     VStack(alignment: .leading, spacing: 10) {
         ForEach(sections) { section in
             Text(section.title)
                 .font(.title)

             ForEach(section.subsection) { subsection in
                 Text(subsection.title)
                     .font(.headline)

                 ForEach(subsection.paragraphs) { paragraph in
                     Text(paragraph.text)
                 }
             }
         }
     }
 }
 */
