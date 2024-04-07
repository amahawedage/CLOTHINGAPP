//
//  Product.swift
//  CLOTHINGAPP
//
//  Created by apple on 06/04/2024.
//

import Foundation

struct Product: Codable,Identifiable {
    let id: String
    let name: String
    let price: Int
    let category: String
    let imageName: String
    let description: String
    let availability:Int
    let tags:[String]
    let availablesize:[String]
    let availablecolor:[String]
    
    
    enum CodingKeys: String, CodingKey
    {
        case id = "_id"
        case name
        case imageName = "imageurl"
        case price
        case category
        case description
        case availability
        case tags
        case availablesize
        case availablecolor
    }
}
