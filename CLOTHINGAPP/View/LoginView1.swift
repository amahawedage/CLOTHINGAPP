//
//  LoginView1.swift
//  CLOTHINGAPP
//
//  Created by apple on 06/04/2024.
//

import Foundation
import SwiftUI

struct LoginView1: View {
    @State private var username = ""
    @State private var password = ""
    @State private var loggedIn = false
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5)
            
            Button(action: {
                loginUser()
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(5)
            }
            
            if loggedIn {
                Text("Logged In Successfully!")
            }
        }
        .padding()
    }
    
    func loginUser() {
        let url = URL(string: "http://localhost:3000/user/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = ["username": username, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let _ = try JSONSerialization.jsonObject(with: data, options: [])
                    DispatchQueue.main.async {
                        self.loggedIn = true
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct LoginView1_Previews: PreviewProvider {
    static var previews: some View {
        LoginView1()
    }
}
