//
//  AppDelegate.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 15. 7. 2025..
//

import UIKit
import SwiftUI /// Required if you use SwiftUI colors in UIColor

class AppDelegate: NSObject, UIApplicationDelegate {
    
    // MARK: - APPLICATION LIFE CYCLE
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // MARK: - TAB BAR APPEARANCE SETUP
                
        /// Creates an instance of UITabBarAppearance
        let appearance = UITabBarAppearance()
                
        /// Configures the background
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = .colorC /// Line at the top of the Tab Bar
        appearance.backgroundColor = UIColor.colorA
                
        
        // MARK: Stacked Layout Appearance
                
        /// For unselected items
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.colorF /// CustomLghtBlue
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.colorF, .font: UIFont.systemFont(ofSize: 14, weight: .bold)] /// CustomLightBlue

        /// For selected items (this will be overridden by the .tint() modifier in SwiftUI if you use it)
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.colorJ /// CustomSoftPink
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.colorJ, .font: UIFont.systemFont(ofSize: 14, weight: .bold)] /// CustomSoftPink
                
        /// Position of Icon and Text
        appearance.stackedLayoutAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 4)
        appearance.stackedLayoutAppearance.selected.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 4)
                
        /// Applies the defined appearance to the UITabBar
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
        return true
    }
}
