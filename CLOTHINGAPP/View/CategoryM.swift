//
//  Category.swift
//  CLOTHINGAPP
//
//  Created by apple on 06/04/2024.
//

import Foundation

struct CategoryM: Codable,Identifiable {
    let id: String
    let code: String
    let name: String
    let imageName: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case code
        case name
        case imageName = "imageurl"
    }
}
