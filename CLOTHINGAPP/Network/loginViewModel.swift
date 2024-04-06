//
//  loginViewModel.swift
//  CLOTHINGAPP
//
//  Created by apple on 31/03/2024.
//

import Foundation
//added
enum ServerError:Error{
    case custom (message:String)
}
class LoginViewModel: ObservableObject {

    @Published var user: User?
    
   
    @Published var showingAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var isLoginSuccessful: Bool = false
    
    func loginUser(username:String,password:String,completion:@escaping (Result<LoginResponse,Error>)->Void) {
        guard let url = URL(string: "http://localhost:3000/user/login") else {
            self.alertMessage = "Invalid URL"
            self.showingAlert = true
            completion(.failure(ServerError.custom(message:"Invalid URL")))
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
                        //self?.isLoginSuccessful=false
                        completion(.failure(ServerError.custom(message:"Login error: \(error.localizedDescription)")))
                    }
                    return
                }
                
                guard let data = data else {
                    DispatchQueue.main.async {
                        self?.alertMessage = "No data received"
                        self?.showingAlert = true
                        //self?.isLoginSuccessful=false
                        completion(.failure(ServerError.custom(message:"No data received")))
                    }
                    return
                }
               
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(LoginResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        if let user = Optional(result.username ){
                            self?.user?.username = username
                            self?.isLoginSuccessful = true // Login successful
                            completion(.success(result))
                        } else {
                            // Unexpected response format
                            self?.alertMessage = "Unexpected response format"
                            self?.showingAlert = true
                            completion(.failure(ServerError.custom(message:"Unexpected response format")))
                        }
                    }
                } catch {
                    print(error)
                    DispatchQueue.main.async {
                        self?.alertMessage = "Error decoding JSON: \(error)"
                        self?.showingAlert = true
                        completion(.failure(ServerError.custom(message:"Error decoding JSON: \(error)")))
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


// MARK: - LoginResponse
struct LoginResponse: Codable {
    let id, username, password, email: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username, password, email
        case v = "__v"
    }
}
