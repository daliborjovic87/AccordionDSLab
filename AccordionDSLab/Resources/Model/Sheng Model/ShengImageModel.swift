//
//  ShengImageModel.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 21. 3. 2025..
//

import Foundation

// MARK: - SHENG IMAGE MODEL
/// A model for decoding Sheng images from a JSON file.
struct ShengImageModel: Codable, Identifiable {
    let id: Int
    let image: String
}
