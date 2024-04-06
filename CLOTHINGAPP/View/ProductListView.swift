//
//  ProductListView.swift
//  CLOTHINGAPP
//
//  Created by apple on 06/04/2024.
//

/*import Foundation
import SwiftUI
struct ProductListView: View {
    @ObservedObject private var viewModel = ProductViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.products) { product in
                ProductCell(product: product)
            }
            .navigationBarTitle("Products")
            .onAppear {
                viewModel.fetchProducts()
            }
        }
    }
}

struct ProductCell: View {
    let product: Product

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.imageURL)) { image in
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
                Text("Price: $\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
                Text("Color: \(product.color)")
                    .font(.subheadline)
            }
        }
    }
}
*/
