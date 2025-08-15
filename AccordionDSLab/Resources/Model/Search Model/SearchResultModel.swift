import SwiftUI
import SwiftData

// MARK: - SEARCH RESULT MODEL
/// A model that represents a single search result.
struct SearchResult: Identifiable, Hashable {
    // MARK: - PROPERTIES
    let id = UUID()
    let title: String
    let sectionOrder: Int?
    let toolbarTitle: String
    let toolbarIcon: String
    let attributedDescription: AttributedString
    let modelType: String

    // MARK: - INITIALIZER
    init(title: String, sectionOrder: Int?, toolbarTitle: String, toolbarIcon: String, description: String, modelType: String) {
        self.title = title
        self.sectionOrder = sectionOrder
        self.toolbarTitle = toolbarTitle
        self.toolbarIcon = toolbarIcon
        self.modelType = modelType
        
        // Attempt to parse Markdown, fall back to plain text if it fails.
        if let attributed = try? AttributedString(markdown: description) {
            self.attributedDescription = attributed
        } else {
            self.attributedDescription = AttributedString(description)
        }
    }

    // MARK: - HASHABLE CONFORMANCE
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: SearchResult, rhs: SearchResult) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - GROUPED SEARCH RESULT MODEL
/// A structure for a grouped search result.
/// It represents a collection of search results that belong to the same main section.
struct GroupedSearchResult: Identifiable, Hashable {
    // MARK: - PROPERTIES
    let id = UUID()
    let groupTitle: String
    let sectionOrder: Int?
    let toolbarTitle: String
    let toolbarIcon: String
    let individualResults: [SearchResult]

    // MARK: - INITIALIZER
    init(groupTitle: String, sectionOrder: Int?, toolbarTitle: String, toolbarIcon: String, individualResults: [SearchResult]) {
        self.groupTitle = groupTitle
        self.sectionOrder = sectionOrder
        self.toolbarTitle = toolbarTitle
        self.toolbarIcon = toolbarIcon
        self.individualResults = individualResults
    }

    // MARK: - HASHABLE CONFORMANCE
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: GroupedSearchResult, rhs: GroupedSearchResult) -> Bool {
        lhs.id == rhs.id
    }
}
