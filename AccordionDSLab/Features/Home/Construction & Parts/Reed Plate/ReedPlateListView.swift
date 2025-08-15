//
//  ReedPlateListView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 5. 5. 2025..
//
import SwiftUI
import SwiftData

struct ReedPlateListView: View {
    // MARK: - PROPERTIES
    @Environment(\.modelContext) private var modelContext
    
    // We are fetching all sections directly from the database.
    @Query(sort: \ReedPlateSection.order) var sections: [ReedPlateSection]

    @State private var selectedItem: Item? = nil

    // MARK: - BODY
    var body: some View {
        VStack {
            CustomToolbarView(title: "Reed Plate", customToolbarIcon: nil, background: .customTeal, fontColor: .customSoftPink).textCase(.uppercase)
            
            Spacer(minLength: 0)
            CustomDivider(color: .customApricotOrange)
            
            List {
                // Using data from the database (sections) instead of a static array.
                ForEach(sections) { section in
                    // Extract the title, order number, and generate a description and icon based on the order number.
                    let itemDetails = getItemDetails(for: section.order)
                    
                    Button {
                        selectedItem = Item(
                            title: section.title,
                            content: itemDetails.description,
                            sectionOrder: section.order,
                            icon: itemDetails.iconName
                        )
                    } label: {
                        ReedPlateItemView(
                            title: section.title,
                            description: itemDetails.description,
                            iconName: itemDetails.iconName,
                            index: section.order
                        )
                    }
                    .listRowInsets(EdgeInsets(.init(top: 12, leading: 10, bottom: 12, trailing: 10)))
                    .listRowBackground(Color.customDarkBrown)
                }
            }
            .listStyle(.plain)
            .listRowSpacing(10)
            .navigationDestination(item: $selectedItem) { item in
                ReedPlateDetailView(order: item.sectionOrder, toolbarTitle: item.title, toolbarIcon: item.icon)
            }
            .ignoresSafeArea(.all)
            
            CustomDivider(color: .customApricotOrange)
            Spacer(minLength: 0)
            
            EmptyBottomBar(color: .customTeal)
        }
        .background(Color.customMediumGrey)
    }
    
    // MARK: - HELPER METHOD
    /// A helper function that returns the description and icon based on the section's order number.
    /// This solution allows for dynamic list creation without data duplication.
    private func getItemDetails(for order: Int) -> (description: String, iconName: String) {
        switch order {
        case 1: return ("From Reed to Steel", "info.circle.fill")
        case 2: return ("Components, Materials, Evolution", "gearshape.fill")
        case 3: return ("Frequency, Shape, Material", "ruler.fill")
        case 4: return ("Calculation, Correction, Production", "cpu.fill")
        case 5: return ("Airflow, Pressure, Sound", "wind")
        case 6: return ("Factories, Legacy, World", "building.2.fill")
        case 7: return ("Factors, Grades, Assessment", "checkmark.seal.fill")
        case 8: return ("Methods, Precision, Maintenance", "tuningfork")
        default: return ("Nema opisa", "questionmark.circle.fill")
        }
    }
}

// MARK: - PREVIEW
struct ReedPlateCustomListView_Previews: PreviewProvider {
    static let previewContainer: ModelContainer = {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        
        do {
            // Create a container with all relevant models
            let container = try ModelContainer(for: ReedPlateSection.self, ReedPlateSubsection.self, ReedPlateText.self, configurations: config)
            
            // Access its main context
            let modelContext = container.mainContext
            
            // Populate data for the preview (this is test data)
            let sectionsForPreview: [(title: String, description: String, iconName: String, order: Int)] = [
                ("About the Free Reed", "From Reed to Steel", "info.circle.fill", 1),
                ("Reed Plate Construction", "Components, Materials, Evolution", "gearshape.fill", 2),
                ("Reed Dimensions & Tone", "Frequency, Shape, Material", "ruler.fill", 3),
                ("Free Reed Design", "Calculation, Correction, Production", "cpu.fill", 4),
                ("Free Reed Oscillation", "Airflow, Pressure, Sound", "wind", 5),
                ("Reed Makers", "Factories, Legacy, World", "building.2.fill", 6),
                ("Reed Plate Quality", "Factors, Grades, Assessment", "checkmark.seal.fill", 7),
                ("Free Reed Tuning", "Methods, Precision, Maintenance", "tuningfork", 8)
            ]
            
            for section in sectionsForPreview {
                let newSection = ReedPlateSection(title: section.title, order: section.order, subsections: [
                    ReedPlateSubsection(title: "Preview Subtitle", order: 1, paragraphs: [
                        ReedPlateText(text: "Ovo je testni paragraf za preview za sekciju: \(section.title).")
                    ])
                ])
                modelContext.insert(newSection)
            }
            
            // Saving the change in a temporary context
            try modelContext.save()
            
            return container
            
        } catch {
            fatalError("Failed to create preview ModelContainer: \(error.localizedDescription)")
        }
    }()

    static var previews: some View {
        NavigationStack {
            ReedPlateListView()
        }
        // Using an already initialized container for the preview
        .modelContainer(previewContainer)
    }
}
