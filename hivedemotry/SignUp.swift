//
//  SignUp.swift
//  hivedemotry
//
//  Created by leena alajlani on 28/05/2023.
//

import SwiftUI

struct SignUp: View {
    
    @State private var name: String = ""
    @State private var birthdate: Date = Date()
//    @State private var gender: String = "Male"
    @State private var location: String = ""
    @State private var disability: Bool = false
    @State private var phoneNumber: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    @EnvironmentObject var firebaseUserManager : firebaseUserManager

    
    var body: some View {
        
        ScrollView{
            HStack{
                Text("welcome to hive ")
                    .font(.system(size: 40, weight: .semibold))
                Spacer()
                
            }.padding(.horizontal, 8)
            VStack {
                
                    TextField("Name", text: $name)
                                .overlay{
                                    
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black,lineWidth: 0.5)
                        .frame(width: 370, height: 50)
                    
                    
                }.padding()
                DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
                    .padding()
                    .overlay{
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black,lineWidth: 0.5)
                            .frame(width: 370, height: 50)

                        
                        
                    }.padding()
                    
                    TextField("Location", text: $location)
                    .padding()
                    .overlay{
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black,lineWidth: 0.5)
                            .frame(width: 370, height: 50)

                        
                        
                    }.padding()
                    Toggle("Disability", isOn: $disability)
                    .padding()
                    .overlay{
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black,lineWidth: 0.5)
                            .frame(width: 370, height: 50)

                        
                        
                    }.padding()
                
                    
                
                
                    TextField("Phone Number", text: $phoneNumber)
                    .padding()
                    .overlay{
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black,lineWidth: 0.5)
                            .frame(width: 370, height: 50)

                        
                        
                    }.padding()
                    TextField("Email", text: $email)
                    .padding()
                    .overlay{
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black,lineWidth: 0.5)
                            .frame(width: 370, height: 50)

                        
                        
                    }.padding()
                
                
             
                    SecureField("Password", text: $password)
                    .padding()
                    .overlay{
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black,lineWidth: 0.5)
                            .frame(width: 370, height: 50)

                        
                        
                    }.padding()
                Button{
                    firebaseUserManager.createNewJobSeeker(name: name,birthdate: birthdate, location: location, disability: disability,phoneNumber: phoneNumber,password: password,email: email ){ isSuccess in
                        
                    }            }label: {
                        Text("Sign up" )
                            .frame(width: 270,height:40)
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                
                
                
            }
            .navigationBarTitle("Sign Up")
        }
    }}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
            .environmentObject(firebaseUserManager())

    }
}
