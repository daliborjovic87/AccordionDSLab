//
//  Untitled.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 17. 1. 2025..
//

import SwiftUI
import UIKit

struct JustifiedTextView: UIViewRepresentable {
    let text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.text = text
        textView.textAlignment = .justified
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 18)
        textView.textColor = .white
        textView.contentSize = CGSize(width: 10, height: 10)
        textView.isEditable = false
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {}
}
