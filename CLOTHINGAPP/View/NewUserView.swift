//
//  NewUserView.swift
//  CLOTHINGAPP
//
//  Created by Anusha on 3/28/24.
//

import Foundation

import SwiftUI
struct NewUserView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var mobile: String = ""
    @State private var address1: String = ""
    @State private var address2: String = ""
    @State private var city: String = ""
    @State private var country: String = ""
    @State private var password: String = ""
    @State private var gotoRegUserConfView = false
    var body: some View {
        VStack {
            Image("DressSmartLogo").padding()
            
            Text("Create New Account")
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
            
            TextField("Name", text: $name)
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(4)
                .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.teal))
                .frame(width: 170)
            
           

            TextField("Email Adddress", text: $email)
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(4)
                .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.teal))
                .frame(width: 170)
            
            TextField("Mobile Number", text: $mobile)
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(4)
                .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.teal))
                .frame(width: 170)
            
            TextField("Address 1", text: $address1)
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(4)
                .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.teal))
                .frame(width: 170)
            
            TextField("Address 2", text: $address2)
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(4)
                .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.teal))
                .frame(width: 170)
            
            TextField("City", text: $city)
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(4)
                .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.teal))
                .frame(width: 170)
            
            /*TextField("Country", text: $country)
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(4)
                .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.teal))
                .frame(width: 170)
            */
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(4)
                .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.teal))
                .frame(width: 170)
            Button(action: {
                // Implement login logic here
                //username = "smart user"
                gotoRegUserConfView = true
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
        
        .fullScreenCover(isPresented: $gotoRegUserConfView){
           RegConf()
        }
    }
    
}

#Preview {
    NewUserView()
}
