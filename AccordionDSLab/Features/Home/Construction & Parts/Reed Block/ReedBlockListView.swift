//
//  ReedBlockListView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 19. 6. 2025..
//

import SwiftUI
import SwiftData

struct ReedBlockListView: View {
    // MARK: - PROPERTIES
    @Environment(\.modelContext) private var modelContext
    
    // Fetches all sections directly from the database.
    @Query(sort: \ReedBlockSection.order) var sections: [ReedBlockSection]
    
    @State private var selectedItem: Item? = nil // Stores the selected item for navigation.
    
    // MARK: - BODY
    var body: some View {
        VStack {
            CustomToolbarView(title: "Reed Block", customToolbarIcon: nil, background: .customTeal, fontColor: .customSoftPink).textCase(.uppercase)
            Spacer(minLength: 0)
            CustomDivider(color: .customApricotOrange)
            
            List {
                // Using data from the database (sections) instead of a static array.
                ForEach(sections) { section in
                    let itemDetails = getItemDetails(for: section.order)
                    
                    Button {
                        selectedItem = Item(
                            title: section.title,
                            content: itemDetails.description,
                            sectionOrder: section.order,
                            icon: itemDetails.iconName
                        )
                    } label: {
                        ReedBlockItemView(
                            title: section.title,
                            description: itemDetails.description,
                            iconName: itemDetails.iconName,
                            index: section.order
                        )
                    }
                    .listRowInsets(EdgeInsets(.init(top: 10, leading: 2, bottom: 10, trailing: 2)))
                    .listRowBackground(Color.customDarkRed)
                }
            }
            .ignoresSafeArea(edges: .all)
            .listStyle(.plain)
            .listRowSpacing(5)
            .navigationDestination(item: $selectedItem) { item in
                ReedBlockDetailView(order: item.sectionOrder, toolbarTitle: item.title, toolbarIcon: item.icon)
            }
            EmptyBottomBar(color: .customTeal)
        }
        .background(Color.customMediumGrey)
    }
    
    // MARK: - HELPER METHOD
    /// A helper function that returns the description and icon based on the section's order number.
    private func getItemDetails(for order: Int) -> (description: String, iconName: String) {
        switch order {
        case 1: return ("Fundamental assembly influencing acoustics, featuring diverse designs for maximizing space and airflow, essential for mounting reed plates and valves.", "square.stack.3d.up.fill")
        case 2: return ("Integrated operation with valve board, register slider, valves, and bellows; details on how air movement activates inner/outer reeds and influences sound intensity.", "arrow.triangle.swap")
        case 3: return ("Detailed structure of wooden reed blocks, including key parts like central support, chambers, and cover; focuses on wood selection, processing, and long-term protection, comparing with polymer alternatives.", "puzzlepiece.fill")
        case 4: return ("Crucial process involving manual positioning and precise waxing for hermetic sealing; details on wax composition and optional mechanical fastening to ensure acoustic performance and joint stiffness.", "puzzlepiece.extension.fill")
        case 5: return ("Designed trapezoidally to adapt to varying frequencies, featuring a mounting lug for secure attachment, specific dimensions, and a critical base angle for optimal acoustic and spatial arrangement.", "square.stack.fill")
        case 6: return ("Explores construction variations in right-hand reed blocks for piano and button accordions, detailing dimensions, voice-specific configurations (bassoon, clarinet, soprano, piccolo), and the influence of mechanical systems on reed plate arrangement.", "square.text.square.fill")
        case 7: return ("Construction variations are defined by the number of voices and bass system type; details include specific configurations for Stradella bass (low, high, and half reed blocks) and Baritone bass (two or three voice setups).", "square.split.2x2.fill")
        case 8: return ("Details the three primary forms of left-hand reed blocks (low-tone, high-tone, half) for Stradella bass, covering their specific dimensions, reed plate arrangement, and special constructions for enhanced acoustic effects.", "arrow.left.and.right.square.fill")
        case 9: return ("Focuses on the standardized design for balanced sound intensity, detailing specific reed plate dimensions, valve types, mounting techniques, and the precise physical characteristics of mounting lugs and bases across all Stradella bass reed block types.", "ruler.fill")
        case 10: return ("Distinct from Stradella, these left-hand reed blocks feature varying reed chamber heights and a larger number of plates to produce individual tones over a wide range, often combining low-tone with two or more high-tone blocks for rich acoustic effects.", "speaker.wave.2.fill")
        case 11: return ("Details the classic construction for two-voice baritone bass systems, outlining the characteristics, module arrangements, precise dimensions of low-tone and high-tone reed blocks, and the non-standardized variations in high-end concert instruments.", "arrow.up.right.and.arrow.down.left.rectangle.fill")
        default: return ("Nema opisa", "questionmark.circle.fill")
        }
    }
}

// MARK: - PREVIEW
struct ReedBlockCustomListView_Previews: PreviewProvider {
    static let previewContainer: ModelContainer = {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        
        do {
            // Create a container with all relevant models
            let container = try ModelContainer(for: ReedBlockSection.self, ReedBlockSubsection.self, ReedBlockText.self, configurations: config)
            
            // Access its main context
            let modelContext = container.mainContext
            
            // Creating test data for the preview
            let testSectionsData: [(title: String, description: String, iconName: String, order: Int)] = [
                ("About the Reed Blocks", "Fundamental assembly influencing acoustics...", "square.stack.3d.up.fill", 1),
                ("Functional Principle of Reed Blocks", "Integrated operation with valve board...", "arrow.triangle.swap", 2),
                ("Reed Block Construction", "Detailed structure of wooden reed blocks...", "puzzlepiece.fill", 3),
                ("Attaching Reed Plates to Reed Blocks", "Crucial process involving manual positioning...", "puzzlepiece.extension.fill", 4),
                ("Right-Hand Reed Blocks", "Designed trapezoidally to adapt...", "square.stack.fill", 5),
                ("Right-Hand Reed Block Construction", "Explores construction variations...", "square.text.square.fill", 6),
                ("Left-Hand Reed Block Construction", "Construction variations are defined...", "square.split.2x2.fill", 7),
                ("Stradella Bass System Reed Blocks", "Details the three primary forms...", "arrow.left.and.right.square.fill", 8),
                ("Classic Construction of Stradella Bass System", "Focuses on the standardized design...", "ruler.fill", 9),
                ("Baritone Bass System Reed Blocks", "Distinct from Stradella, these left-hand...", "speaker.wave.2.fill", 10),
                ("Baritone Bass Blocks: Two-Voice Design", "Details the classic construction...", "arrow.up.right.and.arrow.down.left.rectangle.fill", 11)
            ]
            
            for sectionData in testSectionsData {
                let newSection = ReedBlockSection(title: sectionData.title, order: sectionData.order, subsections: [
                    ReedBlockSubsection(title: "Preview Subtitle", order: 1, paragraphs: [
                        ReedBlockText(text: "Ovo je testni paragraf za preview za sekciju: \(sectionData.title).")
                    ])
                ])
                modelContext.insert(newSection)
            }
            
            // Saving changes in the temporary context
            try modelContext.save()
            
            return container // Return the initialized container
            
        } catch {
            fatalError("Failed to create preview ModelContainer: \(error.localizedDescription)")
        }
    }()
    
    static var previews: some View {
        NavigationStack {
            ReedBlockListView()
        }
        // Using an already initialized container for the preview
        .modelContainer(previewContainer)
    }
}
