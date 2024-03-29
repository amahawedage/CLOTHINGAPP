//
//  NewUserView.swift
//  CLOTHINGAPP
//
//  Created by Anusha on 3/28/24.
//

import Foundation

import SwiftUI
struct NewUserView: View {
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            Image("DressSmartLogo").padding()
            
            Text("Create New Account")
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
            
            TextField("Name", text: $username)
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(4)
                .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.teal))
                .frame(width: 170)
            
           

            TextField("Email Adddress", text: $username)
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(4)
                .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.teal))
                .frame(width: 170)
            
            TextField("Mobile Number", text: $username)
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(4)
                .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.teal))
                .frame(width: 170)
            
            TextField("Address 1", text: $username)
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(4)
                .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.teal))
                .frame(width: 170)
            
            TextField("Address 2", text: $username)
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(4)
                .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.teal))
                .frame(width: 170)
            
            TextField("City", text: $username)
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(4)
                .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.teal))
                .frame(width: 170)
            
            TextField("Country", text: $username)
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(4)
                .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.teal))
                .frame(width: 170)
            
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(4)
                .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.teal))
                .frame(width: 170)
            Button(action: {
                // Implement login logic here
                username = "smart user"
            }) {
                Text("Register")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            Text("Go Back")
                .foregroundColor(.blue)
                .padding(.top)
             
        }
        .padding()
        .padding()
    }
    
}

#Preview {
    NewUserView()
}
