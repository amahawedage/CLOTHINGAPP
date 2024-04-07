//
//  CategoryMView.swift
//  CLOTHINGAPP
//
//  Created by apple on 07/04/2024.
//

import Foundation
import SwiftUI
struct CategoryMView: View {
    
    @ObservedObject var viewModel = CategoryMViewModel()
    @ObservedObject var cartViewModel : CartViewModel;
    var body: some View {
        NavigationView {
            List(viewModel.categories) { categoryM in
                NavigationLink(destination: ProductListView(categoryCode: categoryM.code,cartViewModel:cartViewModel)) {
                //NavigationLink(destination: ProductListView()) {
                    CategoryMRow(category: categoryM)
                }
            }
            .navigationBarTitle("Categories")
            .onAppear {
                viewModel.fetchCategories()
            }
        }
    }
}

struct CategoryMRow: View {
    let category: CategoryM

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: category.imageName)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            } placeholder: {
                ProgressView()
            }

            Text(category.name)

            Spacer()

            Button("Shop") {
                // Navigate to ProductListView with category code
            }
        }
    }
}

/*#Preview {
    CategoryMView(cartViewModel: <#T##CartViewModel#>)
}
*/
