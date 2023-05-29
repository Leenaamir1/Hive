//
//  FirebaseUserManager.swift
//  hivedemotry
//
//  Created by leena alajlani on 20/05/2023.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseStorage


class firebaseUserManager: NSObject, ObservableObject{
    @Published var company:Company = .init()
    @Published var jobSeeker:JobSeeker = .init()

    let auth:Auth
    let firestore:Firestore
    let storage: Storage
    
    override init() {
        self.auth = Auth.auth()
        self.firestore = Firestore.firestore()
        self.storage = Storage.storage()
        super.init()
    }
    
    func fetchCompay(){
        guard let userId = auth.currentUser?.uid else {return}
        firestore.collection("company").document(userId).getDocument { documentSnapshot , error in
            if let error = error {
                print("DEBUG : error while fetching company info \(error.localizedDescription)")
                return
                
            }
            guard let company = try?documentSnapshot?.data(as: Company.self)else {return}
            self.company = company
            
        }
    }
    
    func fetchJobSeeker(){
        guard let userIdd = auth.currentUser?.uid else {return}
        firestore.collection("jobSeeker").document(userIdd).getDocument { documentSnapshot , error in
            if let error = error {
                print("DEBUG : error while fetching student info \(error.localizedDescription)")
               return
                
            }
            guard let jobSeeker = try?documentSnapshot?.data(as: JobSeeker.self)else {return}
            self.jobSeeker = jobSeeker
            
        }
    }
    func createNewUser(email: String,password: String,companyName: String, completion: @escaping((Bool) ->()  )){
        
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("debug: error while creating account \(error.localizedDescription)")
                return
            }
            guard let userId = authResult?.user.uid else {return}
            let company = Company(id: userId, email: email,password: password, companyName: companyName )
            
            try? self.firestore.collection("company").document(userId).setData(from: company)
        }
    }
    
    func createNewJobSeeker(name: String,birthdate: Date, location: String, disability: Bool,phoneNumber: String,password: String,email: String,completion: @escaping((Bool) ->()  )){

       auth.createUser(withEmail: email, password: password) { authResult, error in
           if let error = error {
               print("debug: error while creating account \(error.localizedDescription)")
                return
          }
          guard let userId = authResult?.user.uid else {return}
           let jobSeeker = JobSeeker(name: name,birthdate: birthdate, location: location, disability: disability,phoneNumber: phoneNumber,password: password,email: email )

           try? self.firestore.collection("jobSeeker").document(userId).setData(from: jobSeeker)
        }
    }
}

