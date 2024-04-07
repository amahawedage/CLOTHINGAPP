//
//  ViewCart.swift
//  CLOTHINGAPP
//
//  Created by apple on 01/04/2024.
//

import Foundation
import SwiftUI

struct CartItem: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    var quantity: Int
}

struct ViewCart: View {
    @State private var cartItems: [CartItem] = [
        CartItem(name: "Long Skirt", price: 450.00, quantity: 1),
        //CartItem(name: "Panadol 240 Tablets", price: 838.60, quantity: 2),
        //CartItem(name: "ALZEL 400MG", price: 2935.00, quantity: 1)
    ]
    
    // This would be dynamically calculated based on the cartItems
    @State private var subtotal: Double = 4634.35
    @State private var discount: Double = 0.0
    @State private var grandTotal: Double = 4634.35
    @State private var gotoCheckoutView = false
    @State private var gotoContinueShopping = false
    
    var body: some View {
        VStack {
            Image("DressSmartLogo").padding()
            List {
                Section(header: Text("View Cart")) {
                    ForEach($cartItems) { $item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("Rs \(item.price, specifier: "%.2f")")
                            Spacer()
                            Stepper("Qty: \(item.quantity)", value: $item.quantity, in: 1...99)
                            Button(action: {
                                // Handle remove item action
                            }) {
                                Image("SK1")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
                
                Section {
                    HStack {
                        Text("Sub Total")
                        Spacer()
                        Text("Rs \(subtotal, specifier: "%.2f")")
                    }
                    HStack {
                        Text("Discount")
                        Spacer()
                        Text("Rs \(discount, specifier: "%.2f")")
                    }
                    HStack {
                        Text("Grand Total")
                        Spacer()
                        Text("Rs \(grandTotal, specifier: "%.2f")")
                            .bold()
                    }
                }
            }
            
            // Checkout and continue shopping buttons
            Button("Checkout") {
                // Handle checkout action
                gotoCheckoutView = true
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Button("Continue Shopping") {
                // Handle continue shopping action
                gotoContinueShopping = true
            }
            .padding()
            .background(Color.yellow)
            .foregroundColor(.black)
            .cornerRadius(10)
        }
        .padding()
        
        // Navifgate the page to Checkout
        .fullScreenCover(isPresented: $gotoCheckoutView){
            CheckoutView()
        }
        
        // Navigate the page to Shop By Category
        .fullScreenCover(isPresented: $gotoContinueShopping){
            CategoryMView()
        }
    }
}

#Preview {
    ViewCart()
}
