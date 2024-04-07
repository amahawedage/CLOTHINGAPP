//
//  CartView.swift
//  CLOTHINGAPP
//
//  Created by apple on 07/04/2024.
//
import Foundation
import SwiftUI
// View for displaying the shopping cart
struct CartView: View {
    @ObservedObject var viewModel: CartViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.cartItems) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("Rs.\(item.price * Double(item.quantity))")
                        }
                    }
                    .onDelete(perform: deleteItem)
                }
                
                HStack {
                    Spacer()
                    Text("Total: Rs.\(viewModel.calculateTotal())")
                        .padding()
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Button(action: checkout) {
                        Text("Checkout")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                    
                    Button(action: continueShopping) {
                        Text("Continue Shopping")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .padding()
                    Spacer()
                }
            }
            .navigationBarTitle("Shopping Cart")
        }
    }
    
    // delete item from the cart
    private func deleteItem(at offsets: IndexSet) {
        viewModel.removeItem(at: offsets.first ?? 0)
    }
    
    // navigate to checkout action
    private func checkout() {
        CheckoutView()
    }
    
    // Navigate to continue shopping action
    private func continueShopping() {
        CategoryMView()
    }
}

// SwiftUI previews
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel())
    }
}

//#Preview {
  //CartView()
//}
