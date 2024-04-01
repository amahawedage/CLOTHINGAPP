//
//  ShopByCategory.swift
//  CLOTHINGAPP
//
//  Created by Anusha on 3/27/24.
//

import Foundation

import SwiftUI

struct ShopByCategory: View {
    var body: some View {
        NavigationView {
            VStack(alignment:.center, spacing: 0) {
                HStack {
                    
                    // DressSmart Logo
                    HStack
                    {
                        Image("DressSmartLogo")
                        
                    }
                    
                }
                //.padding()
                
                Text("Shop by Category")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(Category.allCases, id: \.self) { category in
                            CategoryRow(category: category)
                        }
                    }
                    .padding()
                }
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
            case .women: return "Woman"
            case .men: return "Men"
            case .sports: return "Sports"
            case .kids: return "Kids"
            case .baby: return "Baby"
            case .beauty: return "Beauty"
            case .home: return "Home"
            case .offers: return "Offers"
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
                .frame(width: 150, height: 60)
                .clipped()
                .cornerRadius(5)
            Text(category.rawValue)
                .fontWeight(.medium)
            Spacer()
            
            //
            NavigationLink(destination: DisplayItems()) {
            
                Text("Shop")
                    .frame(width:114, height:70, alignment:.center)
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .fontWeight(.bold)
                    
            }
            //
        }
        .frame(height: 60)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShopByCategory()
    }
}
