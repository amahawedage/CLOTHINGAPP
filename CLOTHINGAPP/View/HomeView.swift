//
//  HomeView.swift
//  CLOTHINGAPP
//
//  Created by Anusha on 3/27/24.
//

import Foundation

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack 
                {
                    VStack {
                        Image("DressSmartLogo")
                    }
                    
            
                    
                }
                .padding()
                // Welcome Login user
                Text("Welcome A.B.C Perera") .fontWeight(.semibold)
                // Button to click and select Category to Start Shopping with
                
                Button(action: {
                    // Implement Track Order action
                }) {
                    Text("Shop By Category")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(3)
                        
                }
                    .padding()
                
                              Image("HomeImg2")
                                //.resizable()
                                //.scaledToFit()
                                //.frame(width: 100, height: 100)
                        //}
                    //}
                //}
                .frame(height: 200)
                
                Text("Need Help with Ordering ? \n Call us on 0777 123 456")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding([.horizontal, .trailing], 32)
                    .padding([.top,.trailing],6)
                    .padding([.bottom,.trailing],6)
                    .background(Color.green)
                
                
                Text("We make Cloths \n You make Fashion")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding([.horizontal, .trailing], 65)
                    .padding([.top,.trailing],6)
                    .padding([.bottom,.trailing],6)
                    .background(Color.purple)
                

                HStack {
                    TextField("Enter Your Order ID", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(4)
                        .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.teal))
                        .frame(width: 170)
                    Button(action: {
                        // Implement Track Order action
                    }) {
                        Text("Track Order")
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
