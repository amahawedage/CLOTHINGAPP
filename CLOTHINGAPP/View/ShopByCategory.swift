//
//  ShopByCategory.swift
//  CLOTHINGAPP
//
//  Created by Anusha on 3/27/24.
//

import Foundation

import SwiftUI

struct CategoryView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "line.horizontal.3")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Spacer()
                Image(systemName: "logo.dressmart") // Replace with your logo image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 30)
                Spacer()
                Text("DressSmart")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding()
            
            Text("Shop by Category")
                .font(.title2)
                .fontWeight(.semibold)
                .padding()

            ScrollView {
                VStack(spacing: 20) {
                    ForEach(Category.allCases, id: \.self) { category in
                        CategoryRow(category: category)
                    }
                }
                .padding()
            }
        }
    }
}

enum Category: String, CaseIterable {
    case women = "Women"
    case men = "Men"
    case sports = "Sports"
    case kids = "Kids"
    case baby = "Baby"
    case beauty = "Beauty"
    case home = "Home"
    case offers = "Offers"
    
    var imageName: String {
        switch self {
            case .women: return "category.women"
            case .men: return "category.men"
            // Add the rest of your images names here
            default: return "placeholder.image"
        }
    }
}

struct CategoryRow: View {
    let category: Category

    var body: some View {
        HStack {
            Image(category.imageName) // Replace with your actual image names
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(5)
            Text(category.rawValue)
                .fontWeight(.medium)
            Spacer()
        }
        .frame(height: 60)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
