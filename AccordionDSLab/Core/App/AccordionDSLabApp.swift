//
//  AccordionDSLabApp.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 14. 1. 2025..
//

import SwiftUI
import SwiftData

@main
struct AccordionDSLabApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    // MARK: - PROPERTY: SWIFTDATA CONTAINER
    let sharedModelContainer: ModelContainer
    
    // MARK: - INITIALIZATION
    init() {
        do {
            let config = ModelConfiguration(schema: Schema([ShengSection.self, ShengSubsection.self, ShengText.self,
                                                            ReedPlateSection.self, ReedPlateSubsection.self, ReedPlateText.self,
                                                            ReedBlockSection.self, ReedBlockSubsection.self, ReedBlockText.self,
                                                            VoicesSection.self, VoicesSubsection.self, VoicesText.self
                                                           ]), isStoredInMemoryOnly: false)
            
            sharedModelContainer = try ModelContainer(for: config.schema!, configurations: [config])
            
            populateDataIfNeeded(modelContext: sharedModelContainer.mainContext)
            
        } catch {
            fatalError("Failed to create ModelContainer: \(error.localizedDescription)")
        }
    }
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
        }
        .modelContainer(sharedModelContainer)
    }
    
    // MARK: - HELPER METHODS
    
    /// Checks if data is already in the database and populates it if the database is empty.
    private func populateDataIfNeeded(modelContext: ModelContext) {
        /// A helper function to populate data and reduce code duplication
        func populate<T: PersistentModel>(modelType: T.Type, with populator: () -> Void) {
            do {
                if try modelContext.fetch(FetchDescriptor<T>()).isEmpty {
                    print("Database for type \(modelType) is empty. Populating data...")
                    populator()
                    print("Database for type \(modelType) has been successfully populated.")
                } else {
                    print("Database for type \(modelType) already contains data.")
                }
            } catch {
                print("Error checking/populating for type \(modelType): \(error.localizedDescription)")
            }
        }
        
        populate(modelType: ShengSection.self) { ShengData.populate(modelContext: modelContext) }
        populate(modelType: ReedPlateSection.self) { ReedPlateData.populate(modelContext: modelContext) }
        populate(modelType: ReedBlockSection.self) { ReedBlockData.populate(modelContext: modelContext) }
        populate(modelType: VoicesSection.self) { voicesData.populate(modelContext: modelContext) }
        
        do {
            try modelContext.save()
            print("All changes to the database have been saved.")
        } catch {
            print("Error while saving changes: \(error.localizedDescription)")
        }
    }
}

// MARK: - DATA POPULATOR PROTOCOL
/// A protocol that defines a request for populating a database for a specific model type.
protocol DataPopulator {
    static func populate(modelContext: ModelContext)
    static var modelType: any PersistentModel.Type { get }
}
