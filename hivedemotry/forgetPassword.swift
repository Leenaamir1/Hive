//
//  forgetPassword.swift
//  hivedemotry
//
//  Created by leena alajlani on 20/05/2023.
//

import SwiftUI
import FirebaseAuth

struct forgetPassword: View {
    @State private var email: String = ""
    var body: some View {
        VStack {
            Text("Forgot Password")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)
            
            Button(action: {
                // Code to handle forgot password request
                resetPassword()
                
            }) {
                Text("Reset Password")
                    .foregroundColor(.white)
            }
            .frame(width: 200, height: 50)
            .background(Color.gray)
            .cornerRadius(10)
        }
        .padding()
    }
    func resetPassword(){
        Auth.auth().sendPasswordReset(withEmail: email){ error in
            if let err = error {
                print("Error:\(err.localizedDescription)")
                return
                
            }
            print("reset password")
        }
    }
}
struct forgetPassword_Previews: PreviewProvider {
    static var previews: some View {
        forgetPassword()
    }
}
