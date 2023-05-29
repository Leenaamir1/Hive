//
//  logIn.swift
//  hivedemotry
//
//  Created by leena alajlani on 20/05/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

struct logIn: View {
    @State var email: String = ""
    @State var password: String = ""
    @State private var showSignInView = false
    @State private var showForgetPasswordView = false
    
    


    var body: some View {
        NavigationView {
           
                VStack{
                    HStack{
                        Text("welcome to hive ")
                            .font(.system(size: 40, weight: .semibold))
                        Spacer()
                        
                    }.padding(.horizontal, 8)
                    
                    Spacer()
                    
                    Text("Log In ")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 40, weight: .semibold))
                        .padding(.trailing, 240.0)
                    
                    TextField("Email", text:$email)
                        .padding()
                        .overlay{
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black,lineWidth: 0.5)
                            
                            
                        }.padding()
                    SecureField("Password", text:$password)
                        .padding()
                        .overlay{
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black,lineWidth: 0.5)
                            
                            
                        }.padding()
                    
                    Button{
                        logIn()
                        
                    }label: {
                        Text( "Log in")
                            .frame(width: 270,height:40)
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                    VStack{
                        Button(action: { showForgetPasswordView = true }) {
                            Text("forget password?")
                                .foregroundColor(.gray)
                                .fontWeight(.bold)
                            
                                .padding(.all,20)
                            
                        }
                        NavigationLink("", destination:  forgetPassword(), isActive: $showForgetPasswordView)
                        
                        
                    }
                    
                    VStack{
                        Button(action: { showSignInView = true }) {
                            Text("Don’t have an account? Sign up")
                                .foregroundColor(.gray)
                                .fontWeight(.bold)
                            
                                .padding(.all,20)
                            
                        }
                        NavigationLink("", destination:  ContentView(), isActive: $showSignInView)
                        
                        
                    }
                }
            }
            
            
        }
    func logIn() {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error != nil {
                    print(error?.localizedDescription ?? "")
                } else {
                  
                    print("success")
                   
                }
            }
        }
        
    }


struct logIn_Previews: PreviewProvider {
    static var previews: some View {
        logIn()
    }
}
