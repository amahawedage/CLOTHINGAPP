//
//  RegConf.swift
//  CLOTHINGAPP
//
//  Created by apple on 01/04/2024.
//

import Foundation
import Foundation
import SwiftUI
struct RegConf: View {
    @State private var username: String = ""
    
    @State private var gotoLoginView = false
    var body: some View {
        VStack(alignment:.center, spacing: 5)  {
            Image("DressSmartLogo").padding()
            
            Text("New User Registration Successful")
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
            
            
            
            
            
            Button(action: {
                // Implement login logic here
                
                gotoLoginView = true
            }) {
                Text("OK")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            
        }
        
        .padding()
        .fullScreenCover(isPresented: $gotoLoginView){
             LoginView()
        }
    }
        
}

#Preview {
    RegConf()
}
