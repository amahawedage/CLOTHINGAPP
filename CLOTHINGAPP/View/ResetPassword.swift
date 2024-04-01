//
//  ResetPassword.swift
//  CLOTHINGAPP
//
//  Created by apple on 01/04/2024.
//

import Foundation
import SwiftUI
struct ResetPassword: View {
    @State private var username: String = ""
    

    var body: some View {
        VStack(alignment:.center, spacing: 5)  {
            Image("DressSmartLogo").padding()
            
            Text("Reset Password")
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
            

            TextField("Email Adddress", text: $username)
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(4)
                .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.teal))
                .frame(width: 270)
            
           
            Button(action: {
                // Implement login logic here
                username = "smart user"
            }) {
                Text("Submit")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
             
        }
        .padding()
        .padding()
    }
    
}

#Preview {
    ResetPassword()
}
