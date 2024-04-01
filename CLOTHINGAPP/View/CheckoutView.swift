//
//  CheckoutView.swift
//  CLOTHINGAPP
//
//  Created by apple on 01/04/2024.
//

import Foundation
import SwiftUI

struct CheckoutView: View {
    @State private var userName: String = ""
    @State private var mobileNumber: String = ""
    @State private var emailAddress: String = ""
    @State private var deliveryAddress1: String = ""
    @State private var deliveryAddress2: String = ""
    @State private var city: String = ""
    @State private var selectedPaymentMethod: PaymentMethod = .cashOnDelivery
    @State private var gotoConfirmOrder = false
    // Assuming you have a predefined list of cities
    let cities = ["City A", "City B", "City C"]

    // Enum to represent the payment methods
    enum PaymentMethod {
        case creditCard, cashOnDelivery
    }
    
    // Dummy subtotal, discount, and total
    let subTotal: Double = 4634.35
    let discount: Double = 0.00
    let grandTotal: Double = 4634.35
    
    var body: some View {
        Form {
            Section(header: Text("Payment & Checkout")) {
                TextField("User Name", text: $userName)
                TextField("Mobile Number", text: $mobileNumber)
                TextField("Email Address", text: $emailAddress)
                TextField("Delivery Address 1", text: $deliveryAddress1)
                TextField("Delivery Address 2", text: $deliveryAddress2)
                TextField("City", text: $deliveryAddress2)
                
            }

            Section(header: Text("Select a Payment Method")) {
               

                HStack {
                    Image(systemName: selectedPaymentMethod == .cashOnDelivery ? "circle.fill" : "circle")
                        .onTapGesture {
                            selectedPaymentMethod = .cashOnDelivery
                        }
                    Text("Cash on Delivery")
                }
            }

            Section {
                HStack {
                    Text("Sub Total")
                    Spacer()
                    Text("Rs \(subTotal, specifier: "%.2f")")
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

            Button("Confirm Order") {
                // Handle confirm order action
                gotoConfirmOrder = true 
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
        }
        .navigationBarTitle("Checkout", displayMode: .inline)
        
        // Navif=gate the page to the Home View
        .fullScreenCover(isPresented: $gotoConfirmOrder){
             OrderConf()
        }
    }
    
}


struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
