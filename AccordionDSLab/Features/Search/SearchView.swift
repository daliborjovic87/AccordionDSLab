import SwiftUI
import SwiftData
import Combine

// MARK: - SEARCH VIEW
struct SearchView: View {
    // MARK: - PROPERTIES
    @Environment(\.modelContext) private var modelContext
    @State private var searchText: String = ""
    @FocusState private var isFocused: Bool
    
    // Combine properties for debounce
    @State private var debouncedText: String = ""
    @State private var cancellables = Set<AnyCancellable>()
    private let searchSubject = PassthroughSubject<String, Never>()

    // Fetch all sections from the database for all relevant models
    @Query(sort: \ReedPlateSection.order) var allReedPlateSections: [ReedPlateSection]
    @Query(sort: \ReedBlockSection.order) var allReedBlockSections: [ReedBlockSection]
    @Query(sort: \ShengSection.order) var allShengSection: [ShengSection]

    // MARK: COMPUTED PROPERTY
    var dataSearcher: DataSearcher {
        DataSearcher(allReedPlateSections: allReedPlateSections, allReedBlockSections: allReedBlockSections, allShengSections: allShengSection)
    }

    var groupedResults: [GroupedSearchResult] {
        // The search is now based on debouncedText
        dataSearcher.search(text: debouncedText)
    }

    // MARK: - BODY
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                CustomToolbarView(title: "SEARCH", customToolbarIcon: "magnifyingglass", background: .customTeal, fontColor: .customSoftPink, showDismissButton: false)
//                    .padding(.top, -10)
                
                HStack(spacing: 18) {
                    TextField("Search...", text: $searchText)
                        .padding(12)
                        .frame(maxWidth: 340)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(12)
                        .textInputAutocapitalization(.never)
                        .focused($isFocused)
                    
                    if !searchText.isEmpty {
                        Button("Cancel") {
                            searchText = ""
                            isFocused = false
                        }
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                    }
                        Spacer()
                }
                .padding(.horizontal, 5)
                
                // MARK: - LOGIC FOR DISPLAYING RESULTS AND NO RESULTS VIEW
                if groupedResults.isEmpty && !searchText.isEmpty {
                    NoResultsView(searchText: searchText)
                } else {
                    List(groupedResults, id: \.id) { groupResult in
                        NavigationLink(value: groupResult) {
                            VStack(alignment: .leading) {
                                Text(groupResult.groupTitle)
                                    .font(.headline)
                                
                                Text("\(groupResult.individualResults.count) results")
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                            }
                        }
                        .opacity(1)
                        .animation(.easeIn(duration: 0.5), value: groupedResults)
                    }
                    .listStyle(.plain)
                    .navigationDestination(for: GroupedSearchResult.self) { groupResult in
                        GroupedSearchDetailView(groupedResult: groupResult)
                    }
                }
            }
        }
        .onAppear {
            searchSubject
                .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
                .sink { value in
                    self.debouncedText = value
                }
                .store(in: &cancellables)
        }
        .onChange(of: searchText) { _, newValue in
            searchSubject.send(newValue)
        }
    }
}

// MARK: - PREVIEW
struct SearchView_Previews: PreviewProvider {
    static let previewContainer: ModelContainer = {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        
        do {
            let container = try ModelContainer(for: ReedPlateSection.self, ReedPlateSubsection.self, ReedPlateText.self, ReedBlockSection.self, ReedBlockSection.self, ReedBlockText.self, ShengSection.self, ShengSubsection.self, ShengText.self, configurations: config)
            let modelContext = container.mainContext
            
            ReedPlateData.populate(modelContext: modelContext)
            ReedBlockData.populate(modelContext: modelContext)
            ShengData.populate(modelContext: modelContext)
            
            try modelContext.save()
            
            return container
        } catch {
            fatalError("Failed to create preview ModelContainer: \(error.localizedDescription)")
        }
    }()
    
    static var previews: some View {
        NavigationStack {
            SearchView()
        }
        .modelContainer(previewContainer)
    }
}

// MARK: - NO RESULTS VIEW
struct NoResultsView: View {
    let searchText: String
    
    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: "magnifyingglass.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundStyle(.secondary)
            
            Text("No results found for '\(searchText)'")
                .font(.headline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
