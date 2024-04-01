//
//  OrderConf.swift
//  CLOTHINGAPP
//
//  Created by apple on 01/04/2024.
//

import Foundation

import SwiftUI
struct OrderConf: View {
    @State private var username: String = ""
    @State private var gotoHomeView = false
   
    
    var body: some View {
        VStack(alignment:.center, spacing: 5)  {
            Image("DressSmartLogo").padding()
            
            Text("Order Confirmation")
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
            
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 80, height:80)
                .foregroundColor(Color.green)
            
            Text("Thank you for your Order")
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
            
            Text("Your Order Number : 4545454")
                .padding()
            Text("Your will receive an email confirmation on your order from our email address order@dresssmart.lk")
            
                .padding()
            Button(action: {
                // Implement login logic here
                
                gotoHomeView = true
            }) {
                Text("OK")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            
        }
        
        .padding()
        
        // Navif=gate the page to the Home View
        .fullScreenCover(isPresented: $gotoHomeView){
             HomeView()
        }
    }
        
}

#Preview {
    OrderConf()
}
