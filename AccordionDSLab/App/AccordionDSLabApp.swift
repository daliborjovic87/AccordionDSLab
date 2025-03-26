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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ShengSections.self)
    }
}
