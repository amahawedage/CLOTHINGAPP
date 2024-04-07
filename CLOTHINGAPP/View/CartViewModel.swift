//
//  CartViewModel.swift
//  CLOTHINGAPP
//
//  Created by apple on 07/04/2024.
//

import Foundation
class CartViewModel: ObservableObject {
    @Published var cartItems: [CartItem] = []
    
    // Add item to the cart
    func addItem(name: String, price: Double, quantity: Int = 1) {
        if let index = cartItems.firstIndex(where: { $0.name == name }) {
            cartItems[index].quantity += quantity
        } else {
            cartItems.append(CartItem(name: name, price: price, quantity: quantity))
        }
    }
    
    // Remove item from the cart
    func removeItem(at index: Int) {
        cartItems.remove(at: index)
    }
    
    // Calculate total price of items in the cart
    func calculateTotal() -> Double {
        return cartItems.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
}
