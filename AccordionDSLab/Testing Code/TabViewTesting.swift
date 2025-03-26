//
//  TabViewTesting.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 21. 3. 2025..
//
import SwiftUI

struct TabViewTesting: View {
    @State var selection: Int = 0
    var body: some View {
        TabView {
            Tab("Requests", systemImage: "paperplane") {
                ShengView()
            }


            Tab("Account", systemImage: "person.crop.circle.fill") {
                LogoView()
            }


            TabSection("Messages") {
                Tab("Received", systemImage: "tray.and.arrow.down.fill") {
                    NavigationBarView()
                }


                Tab("Sent", systemImage: "tray.and.arrow.up.fill") {
                    
                }


                Tab("Drafts", systemImage: "pencil") {
                    
                }
            }
        }
        .tabViewStyle(.sidebarAdaptable)    }
}

struct TabViewtesting_Previews : PreviewProvider{
    static var previews:some View {
        TabViewTesting()
    }
}
