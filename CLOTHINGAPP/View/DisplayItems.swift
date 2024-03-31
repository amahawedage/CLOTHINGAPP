//
//  DisplayItems.swift
//  CLOTHINGAPP
//
//  Created by apple on 31/03/2024.
//

import Foundation
import SwiftUI

// Define a model for the skirt items
struct SkirtItem: Identifiable {
    var id = UUID()
    var name: String
    var price: Int
    var imageName: String
}

// Define a view for each skirt item
struct SkirtItemView: View {
    var skirt: SkirtItem
    @State private var selectedSize: String = "S"
    @State private var quantity: Int = 1
    
    var body: some View {
        VStack {
           
            Image(skirt.imageName)
                //.resizable()
                //.aspectRatio(contentMode: .fit)
            
            Text(skirt.name)
                .font(.headline)
            
            // Size selection
            HStack {
                ForEach(["S", "M", "L", "XL"], id: \.self) { size in
                    Button(action: {
                        self.selectedSize = size
                    }) {
                        Text(size)
                            .foregroundColor(self.selectedSize == size ? .white : .black)
                            //.padding()
                            .background(self.selectedSize == size ? .blue : .clear)
                            .cornerRadius(10)
                    }
                }
            }
            
            // Price and quantity
            HStack {
                Text("Price: Rs \(skirt.price)")
                Spacer()
                Stepper(value: $quantity, in: 1...10) {
                    Text("Qty: \(quantity)")
                }
            }//.padding()
            
            // Add to cart button
            Button(action: {
                // Handle add to cart action
            }) {
                Text("Add to Cart")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}

// Define the main view that displays the skirt items
struct DisplayItems: View {
    let skirts = [
        SkirtItem(name: "Silk Skirt", price: 1000, imageName: "SK1"),
        SkirtItem(name: "Silk Fleet Skirt", price: 1500, imageName: "SK2"),
        SkirtItem(name: "Aline Skirt", price: 2100, imageName: "alineSkirt"),
        SkirtItem(name: "Skateboard Skirt", price: 1100, imageName: "skateboardSkirt")
    ]
    
    var body: some View {
        ScrollView {
            VStack {Image("DressSmartLogo")
                Text("Shop By Category")
                    //.font(.largeTitle)
                ForEach(skirts) { skirt in
                    SkirtItemView(skirt: skirt)
                }
            }
        }
    }
}

// Preview provider for SwiftUI previews
struct DisplayItems_Previews: PreviewProvider {
    static var previews: some View {
        DisplayItems()
    }
}
