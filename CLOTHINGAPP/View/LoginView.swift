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
    @State private var gotoHomePage = false
    @State private var showAlert = false
    //@State private var isLoginSuccessfull = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("DressSmartLogo").padding()
                
                TextField("Email Address", text:  $emailaddress)
                
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(4)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.teal))
                    .frame(width: 170)
                
                SecureField("Password", text: $password)
                //TextField("Password", text:  $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(4)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.teal))
                    .frame(width: 170)
                Button(
                    action: {
                    // Implement login logic here
                    //self.flag.toggle()
                    //isLoginSuccessfull = false // make this variable value dynamic based on the authentication from the backend API for user login
                        userControler.loginUser(username: emailaddress, password: password){
                            (result:Result<LoginResponse,Error>) in
                            switch result {
                            case .success(let loginResponse):
                                guard let username = Optional(loginResponse.username) else {return}
                                gotoHomePage = true
                            case .failure(let error):
                                print(error.localizedDescription)
                                showAlert = true
                            }
                            
                        }
                    }
                )
                
                {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                } .alert("Invalid Login Credentials !!",isPresented:$showAlert){
                    Button("OK") {}
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
                
                
                
                
                // Link to Reset Password form to reset password
                NavigationLink(destination: ResetPassword()){
                    Text("Forgot Password ?")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity, minHeight: 52)
                        .underline(true)
                    
                }
                
                // Link to New User Registration form to new User Registration
                NavigationLink(destination: NewUserView()){
                    Text("Register New User")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity, minHeight: 52)
                        .underline(true)
                    
                }
            }
            
            .padding()
            .padding()
            
            // Navigate to the Home Screen
            .fullScreenCover(isPresented: $gotoHomePage){
                HomeView()
            }
        }
    }
    
    // struct HomeView: View {
    //     var body: some View {
    //         Text("Home Page")
    //     }
    // }
}



#Preview {
    LoginView()
}
