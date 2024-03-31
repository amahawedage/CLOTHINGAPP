//
//  LoginView.swift
//  CLOTHINGAPP
//
//  Created by Anusha on 3/27/24.
//

import Foundation
import SwiftUI
struct LoginView: View {
    @State private var emailaddress: String = ""
    @State private var password: String = ""
    @State private var flag: Bool=false
    @State private var isLoginSuccessful: Bool=false
    @StateObject private var userControler=LoginViewModel()
    
    var body: some View {
        
        VStack {
            Image("DressSmartLogo").padding()
            
            TextField("Email Address", text:  $emailaddress)
            
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
                //self.flag.toggle()
                userControler.loginUser(username: emailaddress, password: password)
                
            }
            )
            {
                Text("Login")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            
            
            //NavigationLink(destination: HomeView(),isActive: $userControler.isLoginSuccessful) {
            NavigationLink(
                destination: HomeView(),
                isActive: $userControler.isLoginSuccessful,
                label: { EmptyView() }
            )
            
            
            /* Text("Forgot Password ? ")
             .font(.system(size: 16, weight: .semibold))
             .frame(maxWidth: .infinity, minHeight: 52)
             .underline(true)
             .foregroundColor(.blue)  */
            //}
            .hidden()
            
            
            // Open new User Registration form
            Button
            {
                // action will be here
                //NewUserView()
            } label:
            {
                Text("Forgot Password ?")
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, minHeight: 52)
                    .underline(true)
            }
            
            // Open new User Registration form
            Button
            {
                // action will be here
                // NewUserView()
                //NewUserView()
            } label:
            {
                Text("New User Sign Up")
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, minHeight: 52)
                    .underline(true)
            }
        }
        
        .padding()
        .padding()
    }
    
    struct HomeView: View {
        var body: some View {
            Text("Home Page")
        }
    }
}



#Preview {
    LoginView()
}
