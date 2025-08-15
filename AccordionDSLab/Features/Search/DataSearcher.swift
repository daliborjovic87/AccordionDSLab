//
//  DataSearcher.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 8. 8. 2025..
//

import Foundation
import SwiftData

struct DataSearcher {
    
    // MARK: - PROPERTIES
    
    let allReedPlateSections: [ReedPlateSection]
    let allReedBlockSections: [ReedBlockSection]
    let allShengSections: [ShengSection]
    
    // MARK: - INITIALIZER
    init(allReedPlateSections: [ReedPlateSection], allReedBlockSections: [ReedBlockSection], allShengSections: [ShengSection]) {
        self.allReedPlateSections = allReedPlateSections
        self.allReedBlockSections = allReedBlockSections
        self.allShengSections = allShengSections
    }
    
    // MARK: - SEARCH METHOD
    
    func search(text: String) -> [GroupedSearchResult] {
        guard !text.isEmpty else { return [] }
        let lowercasedSearchText = text.lowercased()
        
        var rawResults: [SearchResult] = []
        
        for section in allReedPlateSections {
            searchInReedPlateSection(section, with: lowercasedSearchText, into: &rawResults)
        }
        for section in allReedBlockSections {
            searchInReedBlockSection(section, with: lowercasedSearchText, into: &rawResults)
        }
        for section in allShengSections {
            searchInShengSection(section, with: lowercasedSearchText, into: &rawResults)
        }
        
        return groupAndSortResults(rawResults)
    }
    
    // MARK: - HELPER METHODS
    
    private func searchInReedPlateSection(_ section: ReedPlateSection, with text: String, into results: inout [SearchResult]) {
        if section.title.lowercased().contains(text) {
            results.append(SearchResult(
                title: section.title,
                sectionOrder: section.order,
                toolbarTitle: section.title,
                toolbarIcon: "info.circle",
                description: "",
                modelType: "ReedPlateSection"
            ))
        }
        
        for subsection in section.subsection {
            if subsection.title.lowercased().contains(text) {
                results.append(SearchResult(
                    title: subsection.title,
                    sectionOrder: section.order,
                    toolbarTitle: section.title,
                    toolbarIcon: "info.circle",
                    description: "",
                    modelType: "ReedPlateSection"
                ))
            }
            
            for paragraph in subsection.paragraphs {
                if paragraph.text.lowercased().contains(text) || (paragraph.imageTitle?.lowercased().contains(text) ?? false) {
                    let snippet = createTextSnippet(from: paragraph.text, with: text)
                    results.append(SearchResult(
                        title: subsection.title,
                        sectionOrder: section.order,
                        toolbarTitle: section.title,
                        toolbarIcon: "info.circle",
                        description: snippet,
                        modelType: "ReedPlateSection"
                    ))
                }
            }
        }
    }
    
    private func searchInReedBlockSection(_ section: ReedBlockSection, with text: String, into results: inout [SearchResult]) {
        if section.title.lowercased().contains(text) {
            results.append(SearchResult(
                title: section.title,
                sectionOrder: section.order,
                toolbarTitle: section.title,
                toolbarIcon: "info.circle",
                description: "",
                modelType: "ReedBlockSection"
            ))
        }
        
        for subsection in section.subsection {
            if subsection.title.lowercased().contains(text) {
                results.append(SearchResult(
                    title: subsection.title,
                    sectionOrder: section.order,
                    toolbarTitle: section.title,
                    toolbarIcon: "info.circle",
                    description: "",
                    modelType: "ReedBlockSection"
                ))
            }
            
            for paragraph in subsection.paragraphs {
                if paragraph.text.lowercased().contains(text) || (paragraph.imageTitle?.lowercased().contains(text) ?? false) {
                    let snippet = createTextSnippet(from: paragraph.text, with: text)
                    results.append(SearchResult(
                        title: subsection.title,
                        sectionOrder: section.order,
                        toolbarTitle: section.title,
                        toolbarIcon: "info.circle",
                        description: snippet,
                        modelType: "ReedBlockSection"
                    ))
                }
            }
        }
    }

    private func searchInShengSection(_ section: ShengSection, with text: String, into results: inout [SearchResult]) {
        if section.title.lowercased().contains(text) {
            results.append(SearchResult(
                title: section.title,
                sectionOrder: section.order,
                toolbarTitle: section.title,
                toolbarIcon: "info.circle",
                description: "",
                modelType: "ShengSection"
            ))
        }
        
        for subsection in section.subsection {
            if subsection.title.lowercased().contains(text) {
                results.append(SearchResult(
                    title: subsection.title,
                    sectionOrder: section.order,
                    toolbarTitle: section.title,
                    toolbarIcon: "info.circle",
                    description: "",
                    modelType: "ShengSection"
                ))
            }
            
            for paragraph in subsection.paragraphs {
                if paragraph.text.lowercased().contains(text) || (paragraph.imageName?.lowercased().contains(text) ?? false) {
                    let snippet = createTextSnippet(from: paragraph.text, with: text)
                    results.append(SearchResult(
                        title: subsection.title,
                        sectionOrder: section.order,
                        toolbarTitle: section.title,
                        toolbarIcon: "info.circle",
                        description: snippet,
                        modelType: "ShengSection"
                    ))
                }
            }
        }
    }
    
    private func createTextSnippet(from fullText: String, with searchText: String) -> String {
        guard let range = fullText.lowercased().range(of: searchText) else { return "" }
        
        let index = fullText.distance(from: fullText.startIndex, to: range.lowerBound)
        let startOffset = max(0, index - 50)
        let endOffset = min(fullText.count, index + searchText.count + 100)
        
        let startIndex = fullText.index(fullText.startIndex, offsetBy: startOffset)
        let endIndex = fullText.index(fullText.startIndex, offsetBy: endOffset)
        
        var snippet = String(fullText[startIndex..<endIndex])
        
        if startOffset > 0 { snippet = "..." + snippet }
        if endOffset < fullText.count { snippet = snippet + "..." }
        
        return snippet
    }
    
    private func groupAndSortResults(_ results: [SearchResult]) -> [GroupedSearchResult] {
        var groupedDictionary: [String: [SearchResult]] = [:]
        for result in results {
            let key = result.toolbarTitle
            groupedDictionary[key, default: []].append(result)
        }
        
        var finalGroupedResults: [GroupedSearchResult] = []
        for (groupTitleKey, resultsInGroup) in groupedDictionary {
            if let firstResult = resultsInGroup.first, let sectionOrder = firstResult.sectionOrder {
                finalGroupedResults.append(GroupedSearchResult(
                    groupTitle: groupTitleKey,
                    sectionOrder: sectionOrder,
                    toolbarTitle: groupTitleKey,
                    toolbarIcon: firstResult.toolbarIcon,
                    individualResults: resultsInGroup.sorted { $0.title < $1.title }
                ))
            }
        }
        
        let orderMap: [String: Int] = ["ReedPlateSection": 1, "ReedBlockSection": 2, "ShengSection": 3]
        
        return finalGroupedResults.sorted { (group1, group2) -> Bool in
            guard let modelType1 = group1.individualResults.first?.modelType,
                  let modelType2 = group2.individualResults.first?.modelType,
                  let order1 = orderMap[modelType1],
                  let order2 = orderMap[modelType2] else { return false }
            return order1 < order2
        }
    }
}

