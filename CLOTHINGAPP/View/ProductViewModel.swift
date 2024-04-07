//
//  ProductViewModel.swift
//  CLOTHINGAPP
//
//  Created by apple on 06/04/2024.
//

import Foundation
class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    private let category_Code: String // A Parameter to get the Category Code Pass from the CategoryMView
    
    init(categoryCode: String) {
            self.category_Code = categoryCode
    }
    
    func fetchProducts() {
        
        // calling Cloth API to fetch product detail
        //let url = URL(string: "http://localhost:3000/products")!
        let url = URL(string: "http://localhost:3000/productbycat/\(category_Code)")!

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
}
