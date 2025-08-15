//
//  ReedBlockDetailView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 19. 6. 2025..
//

import SwiftUI
import SwiftData

struct ReedBlockDetailView: View {
    // MARK: - PROPERTIES
    @Environment(\.modelContext) private var modelContext
    
    @Query var sections: [ReedBlockSection]
    
    let order: Int?
    let toolbarTitle: String
    let toolbarIcon: String
    
    // MARK: - INITIALIZER
    init(order: Int?, toolbarTitle: String, toolbarIcon: String) {
        self.order = order
        self.toolbarTitle = toolbarTitle
        self.toolbarIcon = toolbarIcon
        
        if let sectionOrder = order {
            _sections = Query(filter: #Predicate { $0.order == sectionOrder }, sort: \ReedBlockSection.order)
        } else {
            _sections = Query(filter: #Predicate { $0.order == -1 }, sort: \ReedBlockSection.order)
        }
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            CustomToolbarView(title: toolbarTitle, customToolbarIcon: toolbarIcon, background: .customTeal, fontColor: .customApricotOrange)
            
            Spacer(minLength: 0)
            CustomDivider(color: .customMustardYellow)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    if let section = sections.first {
                        ForEach(section.subsection.sorted(by: { $0.order < $1.order })) { subsection in
                            Text(subsection.title)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .padding(.leading, 5)
                            ForEach(subsection.paragraphs) { paragraph in
                                ParagraphView(
                                    text: paragraph.text,
                                    imageName: paragraph.imageName,
                                    imageTitle: paragraph.imageTitle
                                )
                            }
                            CustomDivider(color: .customApricotOrange)
                        }
                    } else {
                        Text("No information available for this section.")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding()
                    }
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 15)
            }
            
            EmptyBottomBar(color: .clear)
        }
        .background(SpiralMeshGradient().opacity(0.08))
        .toolbar(.hidden, for: .navigationBar)
    }
}

// MARK: - PREVIEW
struct ReedBlockDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        
        do {
            let container = try ModelContainer(for: ReedBlockSection.self, ReedBlockSubsection.self, ReedBlockText.self, configurations: config)
            
            // Populating the database with real data from a file
            ReedBlockData.populate(modelContext: container.mainContext)
            
            return NavigationStack {
                // Displays the first section (order: 1) with real data
                ReedBlockDetailView(
                    order: 3,
                    toolbarTitle: "Reed Block",
                    toolbarIcon: "info.circle"
                )
            }
            .modelContainer(container)
        } catch {
            fatalError("Failed to create preview ModelContainer: \(error)")
        }
    }
}
