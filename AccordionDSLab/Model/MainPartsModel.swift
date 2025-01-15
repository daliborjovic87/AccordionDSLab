//
//  MainParts.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 11. 2. 2025..
//

import Foundation

struct MainPartsModel: Codable, Identifiable {
    let id: Int
    var name: String
    var description: String
    var bullets: [String]
}
