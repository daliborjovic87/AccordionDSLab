//
//  HomeView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 14. 2. 2025..
//

import SwiftUI
import SwiftData

// MARK: - HOME VIEW
/// The main container for TabView navigation between the home and search screens.
struct HomeView: View {
    // MARK: - PROPERTIES
    @State private var selectedTab: Int = 0
    @Environment(\.modelContext) private var modelContext // Retained because it's necessary for the modelContainer() modifier on the TabView.
    
    // MARK: - BODY
    var body: some View {
        TabView(selection: $selectedTab) {
            
            // MARK: - HOME TAB
            NavigationStack {
                HomeContentView()
            }
            .tabItem {
                Label("HOME", systemImage: "house.fill")
            }
            .tag(0)
            
            // MARK: - SHENG TAB
            
            NavigationStack {
                ShengMainView()
            }
            .tabItem {
                Image("sheng_icon")
                    .renderingMode(.template)
                Text("SHENG")
            }
            .tag(1)
            
            // MARK: - SEARCH TAB
            NavigationStack {
                SearchView()
            }
            .tabItem {
                Label("SEARCH", systemImage: "magnifyingglass")
            }
            .tag(2)
        }
    }
}

// MARK: - HOME CONTENT VIEW
/// Displays all content for the home screen (Navigation bar, accordion animation, and categories).
struct HomeContentView: View {
    var body: some View { 
        VStack(spacing: 0) {
            NavigationBarView()
                .safeAreaPadding(.top, 9)
                .padding(.horizontal)
                .padding(.bottom, 9)
                .background(Color.customTeal)
                .shadow(color: Color.black.opacity(0.5), radius: 2, x: 3, y: 3)
            
            CustomDivider(color: .customApricotOrange)
            
            ScrollView(.vertical, showsIndicators: true) {
                AccordionSectionView()
                
                Spacer(minLength: 0)
                
                CategorySectionView()
            }
        }
        .background(Color.customBackground)
    }
}

// MARK: - ACCORDION SECTION VIEW
/// An extracted component that contains the AccordionAnimation and a title for the main sections.
struct AccordionSectionView: View {
    var body: some View {
        AccordionAnimation()
            .padding(.bottom, -8)
        
        CustomDivider(color: .customApricotOrange)
        
        Spacer(minLength: 0)
    }
}

// MARK: - CATEGORY SECTION VIEW
/// An extracted component that contains the "Construction & Parts" title and CategoryGridView.
struct CategorySectionView: View {
    var body: some View {
        HStack {
            Text("Construction & Parts".uppercased())
                .font(.title2)
                .fontWeight(.bold)
                .fontWidth(.condensed)
                .foregroundStyle(Color.customLightBlue)
                .frame(height: 45)
                .shadow(color: .customTeal.opacity(0.5), radius: 1, x: 2, y: 2)
            
            Spacer()
        }
        .padding(.horizontal, 10)
        .background(Color.customGreenPersian)
        
        Spacer(minLength: 0)
        
        ScrollView(.horizontal) {
            CategoryGridView()
                .padding(.bottom, 50)
                .frame(height: 360)
                .padding(.leading, -23)
        }
        .background(
            SpiralMeshGradient()
        )
    }
}

// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static let previewContainer: ModelContainer = {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        
        do {
            // Includes all models in the Preview ModelContainer.
            let container = try ModelContainer(for: ReedPlateSection.self, ReedPlateSubsection.self, ReedPlateText.self, ShengSection.self,ShengSubsection.self, ShengText.self, ReedBlockSection.self, ReedBlockSubsection.self, ReedBlockText.self, configurations: config)
            
            // Populating the database with data for ReedPlate
            ReedPlateData.populate(modelContext: container.mainContext)
            
            // Populating the database with data for Sheng
            ShengData.populate(modelContext: container.mainContext)
            
            // Populating the database with data for ReedBlock
            ReedBlockData.populate(modelContext: container.mainContext)
            
            return container
        } catch {
            fatalError("Failed to create preview ModelContainer: \(error)")
        }
    }()
    
    static var previews: some View {
        HomeView()
            .modelContainer(previewContainer)
    }
}
