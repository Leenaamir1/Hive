//
//  ContentView.swift
//  hivedemotry
//
//  Created by leena alajlani on 20/05/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift


struct ContentView: View{
    @State var isNewUser : Bool = true
    @State var email: String = ""
    @State var password: String = ""
    @State var companyName: String = ""
    
    @EnvironmentObject var firebaseUserManager : firebaseUserManager
    @State var isLoading: Bool = false

    var body: some View {
        NavigationView{
            ScrollView{
                HStack{
                    Text("welcome to hive ")
                        .font(.system(size: 40, weight: .semibold))
                    Spacer()
                    
                }.padding(.horizontal, 8)
                
                
                
                
                TextField("Email", text:$email)
                    .padding()
                    .overlay{
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black,lineWidth: 0.5)
                        
                        
                    }.padding()
                TextField("Company Name", text:$companyName)
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
                    firebaseUserManager.createNewUser(email: email, password: password, companyName: companyName){ isSuccess in 
                        
                    }            }label: {
                        Text("Sign up" )
                            .frame(width: 270,height:40)
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                
            }}
        .navigationTitle("  ")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        
                    }label: {
                        
                    }
                }
            }

    }
    func signIn() {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if error != nil {
                    print(error?.localizedDescription ?? "")
                } else {
                    print("success")
                }
            }
        }
}
struct Company : Codable, Identifiable{
    var id: String = " "
    var email: String = ""
    var password: String = ""
    var companyName: String = ""


    
    
}
struct JobSeeker : Codable, Identifiable{
    var id: String = " "
    var name: String = ""
    var birthdate: Date = Date()
    var location: String = ""
    var disability: Bool = false
    var phoneNumber: String = ""
    var password: String = ""
    var email: String = ""


    
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(firebaseUserManager())
    }
}
