import SwiftUI
import SwiftData

// MARK: - GROUPED SEARCH DETAIL VIEW
/// Displays a detailed list of search results within a single group.
struct GroupedSearchDetailView: View {
    // MARK: - PROPERTIES
    let groupedResult: GroupedSearchResult
    
    // MARK: - BODY
    var body: some View {
        VStack {
            CustomToolbarView(title: groupedResult.toolbarTitle, customToolbarIcon: groupedResult.toolbarIcon, background: .customTeal, fontColor: .customSoftPink)
            
            List {
                ForEach(groupedResult.individualResults, id: \.id) { individualResult in
                    NavigationLink(value: individualResult) {
                        VStack(alignment: .leading) {
                            Text(individualResult.title)
                                .font(.headline)
                            
                            if !individualResult.attributedDescription.characters.isEmpty {
                                Text(individualResult.attributedDescription)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationDestination(for: SearchResult.self) { result in
                switch result.modelType {
                case "ReedPlateSection":
                    if let order = result.sectionOrder {
                        ReedPlateDetailView(order: order, toolbarTitle: result.toolbarTitle, toolbarIcon: result.toolbarIcon)
                    } else {
                        Text("Details are not available.")
                    }
                case "ReedBlockSection":
                    if let order = result.sectionOrder {
                        ReedBlockDetailView(order: order, toolbarTitle: result.toolbarTitle, toolbarIcon: result.toolbarIcon)
                    } else {
                        Text("Details are not available.")
                    }
                case "ShengSection":
                    if let order = result.sectionOrder {
                        ShengDetailView(order: order, toolbarTitle: result.toolbarTitle, toolbarIcon: result.toolbarIcon)
                    } else {
                        Text("Details are not available.")
                    }
                default:
                    Text("Details are not available.")
                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

// MARK: - PREVIEW
struct GroupedSearchDetailView_Previews: PreviewProvider {
    static let previewContainer: ModelContainer = {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        do {
            let container = try ModelContainer(for: ReedBlockSection.self, ReedBlockSubsection.self, ReedBlockText.self, ShengSection.self, ShengSubsection.self, ShengText.self, configurations: config)
            ReedBlockData.populate(modelContext: container.mainContext)
            ShengData.populate(modelContext: container.mainContext)
            return container
        } catch {
            fatalError("Failed to create preview ModelContainer: \(error)")
        }
    }()

    static var previews: some View {
        NavigationStack {
            let sampleResults = [
                SearchResult(title: "The Operating Principle", sectionOrder: 1, toolbarTitle: "Reed Plate", toolbarIcon: "info.circle", description: "This is an **example** of paragraph...", modelType: "ShengSection"),
            ]
            
            let sampleGroupedResult = GroupedSearchResult(
                groupTitle: "Reed Plate",
                sectionOrder: 1,
                toolbarTitle: "Reed Plate",
                toolbarIcon: "info.circle",
                individualResults: sampleResults
            )
            
            GroupedSearchDetailView(groupedResult: sampleGroupedResult)
        }
        .modelContainer(previewContainer)
    }
}
