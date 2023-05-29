//
//  pathsView.swift
//  hivedemotry
//
//  Created by leena alajlani on 28/05/2023.
//


    import SwiftUI

struct pathsView: View {
    @State var showCompanyPage: Bool = false
    @State var showJobSeekerPage: Bool = false
    
    
    var body: some View {
        NavigationView {
            
            VStack {
                Text("Welcome!")
                    .font(.largeTitle)
                    .padding(.bottom, 50)
                
                Button(action: { showCompanyPage = true }) {
                    Text("company")
                       
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .padding(.all,20)
                    
                }
                
                NavigationLink("", destination:  logIn(), isActive: $showCompanyPage)
                
                Button(action: { showJobSeekerPage = true }) {
                    Text("Job Seeker")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    
                        .padding(.all,20)
                    
                }
                NavigationLink("", destination:  SignUp(), isActive: $showJobSeekerPage)
                
                
            }
        }
    }
}


struct pathsView_Previews: PreviewProvider {
    static var previews: some View {
        pathsView()
    }
}


