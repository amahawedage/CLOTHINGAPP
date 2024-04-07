//
//  HomeView.swift
//  CLOTHINGAPP
//
//  Created by Anusha on 3/27/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @StateObject var cartViewModel = CartViewModel();
        var body: some View {
                NavigationView {
                    VStack(alignment:.center, spacing: 0) {
                        // DressSmart Logo
                        HStack
                        {
                            // DS Logo
                            Image("DressSmartLogo")
                        }
                        .padding()
                        
                       
                        // Welcome Login user name
                        Text("Welcome A.B.C Perera") .fontWeight(.semibold)
                            .padding()
                        
                        // Navigate to Shop by category view
                        //NavigationLink(destination: DestinationView(data: "View Items by Category !")) {
                        NavigationLink(destination: CategoryMView(cartViewModel:cartViewModel)) {
                        
                            Text(" Shop By Category ")
                                .frame(width:294, height:70, alignment:.center)
                                .foregroundColor(Color.white)
                                .background(Color.gray)
                                .fontWeight(.bold)
                                
                        }
                        
                        // Display Main Image
                        Image("HomeImg2")
                        
                        // Infor Text Messages
                        
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
                        
                         
                        // Track Order Fields
                        HStack
                        {
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
                    }
                }
            }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
