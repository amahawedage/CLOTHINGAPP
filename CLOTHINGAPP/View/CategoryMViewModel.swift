//
//  CategoryMViewModel.swift
//  CLOTHINGAPP
//
//  Created by apple on 07/04/2024.
//

import Foundation
class CategoryMViewModel: ObservableObject {
    @Published var categories: [CategoryM] = []
   

    func fetchCategories() {
        // calling Cloth API to fetch product detail
        let url = URL(string: "http://localhost:3000/categories")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let categories = try JSONDecoder().decode([CategoryM].self, from: data)
                    DispatchQueue.main.async {
                        self.categories = categories
                    }
                } catch {
                    print("Error decoding categories: \(error)")
                }
            }
        }.resume()
    }
}
