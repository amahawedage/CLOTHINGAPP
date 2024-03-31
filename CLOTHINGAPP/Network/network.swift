//
//  network.swift
//  CLOTHINGAPP
//
//  Created by apple on 30/03/2024.
//

import Foundation
class APIService {

    // Function to call a GET API
    func callAPI(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        // Ensure the URL is valid
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "InvalidURL", code: -1, userInfo: nil)))
            return
        }
        
        // Create a URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Create a URLSession data task
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle errors
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Ensure we received data
            guard let data = data else {
                completion(.failure(NSError(domain: "NoData", code: -2, userInfo: nil)))
                return
            }
            
            // Successful response with data
            completion(.success(data))
        }
        task.resume()
    }
}
