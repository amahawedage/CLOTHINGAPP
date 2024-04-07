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
    //@StateObject var viewModel: CartViewModel
    @ObservedObject var cartViewModel: CartViewModel
    @State private var gotoCheckoutView = false
    @State private var gotoContinueShopping = false
    var body: some View {
        //NavigationView
        //{
        Text("Shopping Cart") .fontWeight(.semibold)
            .padding()
            VStack {
                List {
                    ForEach(cartViewModel.cartItems) { item in
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
                    Text("Total: Rs.\(cartViewModel.calculateTotal())")
                        .padding()
                    Spacer()
                }
                
           
                
                
                /*NavigationView
                {
                    HStack
                    {
                        Spacer()
                        NavigationLink(destination: CheckoutView()) {
                            Button(action: checkout) {
                                Text("Checkout")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            .padding()
                        }
                        NavigationLink(destination: CategoryMView(cartViewModel:cartViewModel)) {
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
                }*/
                
                
                // Checkout and continue shopping buttons
                Button(" Checkout ") {
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
                
                // Navifgate the page to Checkout
                .fullScreenCover(isPresented: $gotoCheckoutView){
                    CheckoutView()
                }
                
                // Navigate the page to Shop By Category
                .fullScreenCover(isPresented: $gotoContinueShopping){
                    //CategoryMView()
                    CategoryMView(cartViewModel:cartViewModel)
                     
                }
            //}
            //.navigationBarTitle("Shopping Cart")
        }
    }
    
    // delete item from the cart
    private func deleteItem(at offsets: IndexSet) {
        cartViewModel.removeItem(at: offsets.first ?? 0)
    }
    
    // navigate to checkout action
    private func checkout() {
        CheckoutView()
    }
    
    // Navigate to continue shopping action
    private func continueShopping() {
        CategoryMView(cartViewModel: cartViewModel)
        
    }
}

// SwiftUI previews
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(cartViewModel: CartViewModel())
    }
}

//#Preview {
  //CartView()
//}
