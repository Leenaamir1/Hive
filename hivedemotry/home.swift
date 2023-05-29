//
//  home.swift
//  hivedemotry
//
//  Created by leena alajlani on 21/05/2023.
//

import SwiftUI

struct home: View {
    @StateObject private var FirebaseUserManager = firebaseUserManager()
    var body: some View {
        VStack{
            Text("No jobs yet")
        }
    }
}

struct home_Previews: PreviewProvider {
    static var previews: some View {
        home()
            .environmentObject(firebaseUserManager())

    }
}
