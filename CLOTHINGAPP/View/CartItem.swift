//
//  CartItem.swift
//  CLOTHINGAPP
//
//  Created by apple on 07/04/2024.
//

import Foundation
// Model for cart
struct CartItemM: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    var quantity: Int
}
