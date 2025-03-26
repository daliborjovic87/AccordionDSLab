//
//  ShengCustomBarView.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 26. 3. 2025..
//

import SwiftUI

struct ShengBottomBarView: View {
    var body: some View {
        // MARK: - RADNA VERZIJA NAVIGACIJE, IKONE TREBA DIZAJNIRATI
        HStack {
            
            Spacer()
            
            NavigationLink(destination: ShengInfo()) {
                Label(title: {
                    VStack(spacing: 8) {
                        Image("shengPic_1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .background(colorBackground)
                            .shadow(color: .gray, radius: 5, x: 5, y: 5)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.black, lineWidth: 1)
                            }
                        Text("Osnovne informacije")
                            .font(.custom("Helvetica", size: 14))
                            .foregroundColor(.black)
                            
                    }
                }, icon: {})
            }
            
            Spacer()
            
            NavigationLink(destination: Text("Link 2 View")) {
                Label(title: {
                    VStack(spacing: 8) {
                        Image("shengPic_2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .background(colorBackground)
                            .shadow(color: .gray, radius: 5, x: 5, y: 5)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.black, lineWidth: 1)
                            }
                        Text("Konstrukcija")
                            .font(.custom("Helvetica", size: 14))
                            .foregroundColor(.black)
                            
                    }
                }, icon: {})
            }
            
            Spacer()
            
            NavigationLink(destination: Text("Link 3 View")) {
                Label(title: {
                    VStack(spacing: 8) {
                        Image("shengPic_3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .background(colorBackground)
                            .shadow(color: .gray, radius: 5, x: 5, y: 5)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.black, lineWidth: 1)
                            }
                        Text("Akustika")
                            .font(.custom("Helvetica", size: 14))
                            .foregroundColor(.black)
                            
                    }
                }, icon: {})
            }
            
            Spacer()
        }
    }
}

struct ShengCustomBarView_previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShengBottomBarView()
        }
    }
}
