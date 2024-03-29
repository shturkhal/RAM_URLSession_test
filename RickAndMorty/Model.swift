//
//  Model.swift
//  RickAndMorty
//
//  Created by Іван Штурхаль on 02.08.2023.
//

import Foundation


// MARK: - Rik
struct Rik: Decodable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Decodable {
    let name: String
    let url: String
}
