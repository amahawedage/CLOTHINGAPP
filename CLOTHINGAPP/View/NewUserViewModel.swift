//
//  NewUserViewModel.swift
//  CLOTHINGAPP
//
//  Created by apple on 06/04/2024.
//

import Foundation


// MARK: - NewUserResponse
struct NewUserResponse: Codable {
    let username, password, email, id: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case username, password, email
        case id = "_id"
        case v = "__v"
    }
}
