//
//  User.swift
//  CLOTHINGAPP
//
//  Created by apple on 31/03/2024.
//

import Foundation

struct User: Codable {
    var username: String
    var password: String // Note: Storing passwords in plain text is a bad practice
    var email: String
    
    // Add any other user properties here
}
