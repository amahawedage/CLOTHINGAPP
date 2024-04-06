//
//  ProductViewModel.swift
//  CLOTHINGAPP
//
//  Created by apple on 06/04/2024.
//

import Foundation
/*class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []

    func fetchProducts() {
        // Cloth API
        let url = URL(string: "http://localhost:3000/products")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                if let decodedProducts = try? decoder.decode([Product].self, from: data) {
                    DispatchQueue.main.async {
                        self.products = decodedProducts
                    }
                }
            }
        }.resume()
    }
}*/
