//
//  ParagraphView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 10. 8. 2025..
//

import SwiftUI
import SwiftData

/// A reusable component for displaying a single paragraph with an image and a title.
struct ParagraphView: View {
    // MARK: - PROPERTIES
    let text: String
    let imageName: String?
    let imageTitle: String?
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Displays text, parsed as Markdown
            if let attributedText = try? AttributedString(markdown: text) {
                MarkdownText(attributedText: attributedText, paragraphSpacing: 10)
            }
            
            // Displays the image, if it exists
            if let imageName = imageName {
                Image(imageName)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .shadow(color: .customMediumGrey, radius: 5, x: 5, y: 5)
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
                    .padding(.all)
                    .background(Color.customMustardYellow.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.customMediumGrey, lineWidth: 2)
                            .shadow(color: Color.customDarkBrown, radius: 5, x: 1, y: 1)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                    )
                    .padding(.vertical, 10)
            }
            
            // Displays the image title, if it exists
            if let imageTitle = imageTitle {
                Text(imageTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.top, -10)
                    .padding(.bottom, 10)
            }
        }
    }
}

// MARK: - PREVIEW
struct ParagraphView_Previews: PreviewProvider {
    static let previewContainer: ModelContainer = {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        
        do {
            let container = try ModelContainer(for: ReedPlateSection.self, ReedPlateSubsection.self, ReedPlateText.self, ShengSection.self, configurations: config)
            let modelContext = container.mainContext
            
            // Populating the database with real data
            ReedPlateData.populate(modelContext: modelContext)
            
            return container
        } catch {
            fatalError("Failed to create preview ModelContainer: \(error)")
        }
    }()
    
    static var previews: some View {
        // Fetching the first paragraph from the database and displaying it
        let fetchDescriptor = FetchDescriptor<ReedPlateText>()
        let firstParagraph = try? previewContainer.mainContext.fetch(fetchDescriptor).first
        
        if let paragraph = firstParagraph {
            ParagraphView(
                text: paragraph.text,
                imageName: paragraph.imageName,
                imageTitle: paragraph.imageTitle
            )
            .padding()
            .background(Color.gray.opacity(0.2))
            .previewLayout(.sizeThatFits)
            .modelContainer(previewContainer)
        } else {
            Text("There is no paragraph available for preview.")
                .padding()
                .modelContainer(previewContainer)
        }
    }
}
