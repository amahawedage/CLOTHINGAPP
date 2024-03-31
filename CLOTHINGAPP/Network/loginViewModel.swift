//
//  loginViewModel.swift
//  CLOTHINGAPP
//
//  Created by apple on 31/03/2024.
//

import Foundation

class LoginViewModel: ObservableObject {

    @Published var user: User?
    
   
    @Published var showingAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var isLoginSuccessful: Bool = false
    
    func loginUser(username:String,password:String) {
        guard let url = URL(string: "http://localhost:3000/user/login") else {
            self.alertMessage = "Invalid URL"
            self.showingAlert = true
            return
        }

        let requestBody: [String: String] = [
            "username": username,
            "password": password
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestBody)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
                if let error = error {
                    DispatchQueue.main.async {
                        self?.alertMessage = "Login error: \(error.localizedDescription)"
                        self?.showingAlert = true
                    }
                    return
                }
                
                guard let data = data else {
                    DispatchQueue.main.async {
                        self?.alertMessage = "No data received"
                        self?.showingAlert = true
                    }
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(LoginResponse.self, from: data)
                    /*commented by AP
                     DispatchQueue.main.async {
                        self?.user = result.user
                        self?.isLoginSuccessful = true // Login successful
                    }*/
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self?.isLoginSuccessful = true
                    }
                    
                } catch {
                    DispatchQueue.main.async {
                        self?.alertMessage = "Error decoding JSON: \(error)"
                        self?.showingAlert = true
                    }
                }
            }.resume()
        } catch {
            DispatchQueue.main.async {
                self.alertMessage = "Error serializing JSON: \(error)"
                self.showingAlert = true
            }
        }
    }
}


struct LoginResponse: Codable {
    let user: User
}
