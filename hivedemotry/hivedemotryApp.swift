//
//  hivedemotryApp.swift
//  hivedemotry
//
//  Created by leena alajlani on 20/05/2023.
//

import SwiftUI
import Firebase

@main
struct hivedemotryApp: App {
    @StateObject private var FirebaseUserManager = firebaseUserManager()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            pathsView ()
                .environmentObject(FirebaseUserManager)
        }
    }
}
