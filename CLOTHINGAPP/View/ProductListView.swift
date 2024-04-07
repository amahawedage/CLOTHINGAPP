//
//  ProductListView.swift
//  CLOTHINGAPP
//
//  Created by apple on 06/04/2024.
//

import Foundation
import SwiftUI
struct ProductListView: View {
    
    //commented the below by AP
    @ObservedObject private var viewModel: ProductViewModel
    let categoryCode: String
    
    init(categoryCode: String) {
        self.categoryCode = categoryCode
        self.viewModel = ProductViewModel(categoryCode: categoryCode)
    }
    
    var body: some View
    {
        //Image("DressSmartLogo")
        
        NavigationView {
            List(viewModel.products) { product in
                ProductCell(product: product)
            }
            //.navigationBarTitle("Products")
            .navigationBarTitle("Product: \(categoryCode)")
            .onAppear {
                viewModel.fetchProducts()
            }
            
        }
    }
        
    struct ProductCell: View {
        let product: Product
        
        @State private var gotoCart = false
        var body: some View {
            HStack
            {
                AsyncImage(url: URL(string: product.imageName)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 100, maxHeight: 100)
                } placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .font(.headline)
                    Text("Price: Rs.\(product.price)")
                        .font(.subheadline)
                    Text("Qty:\(product.availability)")
                        .font(.subheadline)
                    Text("Color: \(product.availablecolor)")
                        .font(.subheadline)
                    Spacer()
                    
                    HStack{
                        // Add to cart button
                        Button(action: {
                            // Handle add to cart action
                            gotoCart = true
             
                            
                        }) {
                            Text("Add to Cart")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    }
                }
                .fullScreenCover(isPresented: $gotoCart){
                    //ViewCart()
                    CartView(viewModel: CartViewModel())
                }
            }
        }
    }
}

#Preview {
    ProductListView(categoryCode: "categoryCode")
}
