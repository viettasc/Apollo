//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Viettasc Doan on 3/27/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import Foundation

// T some soft of type: temp to return
extension Bundle {
    // T replace [Astronaut]
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        let decoder = JSONDecoder()
        // decode for Date
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        //
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        return loaded
    }
}
