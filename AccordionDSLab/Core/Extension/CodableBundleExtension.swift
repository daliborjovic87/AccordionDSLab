//
//  CodableBundleExtension.swift
//  AccordionDSLab
//
//  Created by Dalibor Jovic on 11. 2. 2025..
//

import Foundation

// JSON DATA
let shengPhotos: [ShengImageModel] = Bundle.main.decode("sheng.json")

extension Bundle {
    // MARK: - JSON DECODING HELPER
        /// Decodes a JSON file from the app's main bundle.
        /// - Parameter file: The name of the JSON file, including the extension.
        /// - Returns: The decoded object of type T, which must conform to the Codable protocol.
    
    func decode<T: Codable>(_ file: String) -> T {
        // 1. Find the URL of the JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        // 2. Load the data from the file
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        // 3. Create a JSON decoder
        let decoder = JSONDecoder()
        
        // 4. Attempt to decode the data into the specified type
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        // 5. Return the decoded object
        return decodedData
    }
}
