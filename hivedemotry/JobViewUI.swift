//
//  JobViewUI.swift
//  hivedemotry
//
//  Created by leena alajlani on 29/05/2023.
//

import SwiftUI

struct JobViewUI: View {
    @Binding var AddJob: AddJob
    @State private var text = ""
    let characterLimit = 200
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>


    var body: some View {
        NavigationView{
            ScrollView{
                // the main box
                //Type city Time date
                
                VStack{
//////                    Text("888")
//////                        .font(.system(size: 24))
//////                        .fontWeight(.bold)
////                    Spacer()
//                        .frame(height: 28)
                    NavigationLink(destination: ADDjobView_cuurct()) {
                        Text("View applicants")
                            .frame(width:320 ,alignment: .leading)
                            .foregroundColor(Color("A48B40"))
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .padding()
                        
                    }
                    Spacer()
                        .frame(height: 37)
                    //the card
                    ZStack{
                        Rectangle()
                            .fill(
                                   LinearGradient(
                                       gradient: Gradient(
                                           colors: [
                                            Color("FFF3C3"),
                                            Color("C4B383")
                                           ]
                                       ),
                                       startPoint: .trailing,
                                       endPoint: .leading
                                   )
                               )
                               .opacity(0.5)
                               .cornerRadius(28)
                               .frame(width: 345, height: 176)

                        
                        //NOTE: company image
                        //for now we're haviing an empty frame for it
                        VStack{
                            HStack{
                                VStack{
                                    //where the image goes
                                    ForEach(AddJob.CompanyImage,id:\.self){ imageName in
                                        Image(imageName)
                                            .resizable()
                                            .frame(width: 69, height: 69)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                    }

                                }

                                Spacer()
                                    .frame(width: 15)
                                VStack(alignment: .leading){
                                    //job title
//                                    Text(addJobSample.JobType.title)
                                    Text("Chasher")

                                        .foregroundColor(.black)
                                    .font(.system(size: 24))
                                    .frame(width: 164,alignment: .leading)

                                    Spacer()
                                        .frame(height: 9)
                                    //type city district
                                    HStack(spacing: 8){
                                        //type
                                        
                                                ZStack{
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .foregroundColor(Color("C4B383"))

                                                    Text(addJobSample.JobType.title)
                                                        .fontWeight(.regular)
                                                        .foregroundColor(Color.black)
                                                        .font(.system(size: 12))
                                                }
                                                .frame(width: 63, height: 20)
                                        
                                        
                                        //city
                                        
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 8)
                                                    .foregroundColor(Color("C4B383"))
                                                Text(addJobSample.CityOfTheJob.title)
                                                    .fontWeight(.regular)
                                                    .foregroundColor(Color.black)
                                                    .font(.system(size: 12))
                                            }
                                            .frame(width: 63, height: 20)

                                        
                                        
                                        //district
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 8)
                                                .foregroundColor(Color("C4B383"))

                                            Text("District")
                                                .fontWeight(.regular)
                                                .foregroundColor(Color.black)
                                                .font(.system(size: 12))
                                        }
                                        .frame(width: 63, height: 20)
                                    }

                                    
                                }
                                .padding(.trailing, 30)
                                .padding(.bottom, 20)

                                    
                            }
                            Spacer()
                                .frame(height: 13)
                            
                            HStack{
                                VStack(alignment: .leading){
                                    
                                    //date
                                    HStack(spacing: 0){
                                        Text(" Starts on")
                                            .foregroundColor(Color.gray)
                                        Text(" June 1,  2023")
                                    }
                                    .fontWeight(.regular)
                                    .font(.system(size: 16))

                                    Spacer()
                                        .frame(height: 15)
                                    
                                    //time
                                    HStack(spacing: 3){
                                        Text(" 8:00 AM")
                                        Text("-")
                                            .foregroundColor(Color.gray)
                                        Text("1:00 PM")
                                    }
                                    .font(.system(size: 16))
                                    .fontWeight(.regular)
                                    .frame(width: 140)
                                }
                                //--------------------------

                                Spacer()
                                    .frame(width: 20)
                                //--------------------------
                                VStack(alignment: .leading){

                                    //duration
                                    HStack{
                                        Text("Duration")
                                            .frame(width: 70)
                                            .fontWeight(.regular)
                                            .foregroundColor(Color.gray)
                                        Spacer()
                                            .frame(width: 0)
                                        Text("\(AddJob.Duration) days")
                                    }
                                    .font(.system(size: 16))
                                    .frame(width: 135)


                                    
                                    Spacer()
                                        .frame(height: 15)

                                    //salary
                                    HStack{
                                        if let doubleValue = Double?(AddJob.Salary) {
                                            let intValue = Int(doubleValue)
                                            Text("\(intValue)")
                                                .font(.system(size: 16))
                                                .lineLimit(1)
                                                .frame(width: 40)
                                                .fontWeight(.medium)
                                        } else {
                                            Text("Invalid number")
                                        }
                                        Spacer()
                                            .frame(width: 0)
                                        Text("SR")
                                            .fontWeight(.medium)
                                        Spacer()
                                            .frame(width: 0)
                                        Text("/ day")
                                            .fontWeight(.regular)
                                            .foregroundColor(Color.gray)
//                                            .opacity(0.45)
                                    }
                                    .font(.system(size: 16))
                                    .padding(.leading, 8)


                                    

                                    
                                }
                            }
                            .padding(.bottom, 10)
                        }
                
                    }
                    .frame(width: 145, height: 176)
                    //end of card
                    
                    Spacer()
                        .frame(height: 32)
                    
                }
                .padding(.top, -40)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.backward")
                            Text(" ")
                        }
                    }
                )
                
                //description card
                ZStack{
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color("FBFAF6"))
                        .frame(width: 345, height: 224)
                    VStack(alignment: .leading){
                        Text("Description")
                            .fontWeight(.bold)
                            .font(.system(size: 16))
                            .multilineTextAlignment(.leading)
                            .frame(width: 100)


                        VStack(alignment: .leading){
                            Text(AddJob.Descreption)
                                .padding(.trailing, 140) // add left padding
                                .padding(.top, -60) // add top padding
                                .font(.system(size: 16))
                                .fontWeight(.thin)
                                .frame(width: 327, height: 123)
                                .multilineTextAlignment(.leading)

                            Text("\(characterLimit - AddJob.Descreption.count)/200")
                                .multilineTextAlignment(.trailing)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.top, -20)
                        }
                            .opacity(0.45)

                    }
                    .frame(width: 316)
                }
                Spacer()
                    .frame(height: 32)
                //----------------------------------------------------------
                
                //Responsibilites card
                ZStack{
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color("FBFAF6"))
                        .frame(width: 345, height: 224)
                    VStack(alignment: .leading){
                        Text("Responsibilites")
                            .fontWeight(.bold)
                            .font(.system(size: 16))
                            .multilineTextAlignment(.leading)
                            .frame(width: 130)


                        VStack(alignment: .leading){
                            Text(AddJob.Responsibilites)
                                .padding(.trailing, 120) // add left padding
                                .padding(.top, -60) // add top padding
                                .font(.system(size: 16))
                                .fontWeight(.thin)
                                .frame(width: 327, height: 123)
                                .multilineTextAlignment(.leading)

                            Text("\(characterLimit - AddJob.Responsibilites.count)/200")
                                .multilineTextAlignment(.trailing)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.top, -20)
                        }
                            .opacity(0.45)

                    }
                    .frame(width: 316)
                }
                Spacer()
                    .frame(height: 32)
                //----------------------------------------------------------
                
                //Requirements card
                ZStack{
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color("FBFAF6"))
                        .frame(width: 345, height: 224)
                    VStack(alignment: .leading){
                        Text("Requirements")
                            .fontWeight(.bold)
                            .font(.system(size: 16))
                            .multilineTextAlignment(.leading)
                            .frame(width: 130)


                        VStack(alignment: .leading){
                            Text(AddJob.Requirements)
                                .padding(.trailing, 150) // add left padding
                                .padding(.top, -60) // add top padding
                                .font(.system(size: 16))
                                .fontWeight(.thin)
                                .frame(width: 327, height: 123)
                                .multilineTextAlignment(.leading)

                            Text("\(characterLimit - AddJob.Requirements.count)/200")
                                .multilineTextAlignment(.trailing)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.top, -20)
                        }
                            .opacity(0.45)

                    }
                    .frame(width: 316)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct JobViewUI_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView{
            JobViewUI(AddJob:.constant(addJobSample))
        }
    }
}

let addJobSample: AddJob = .init(CompanyImage:["Image1"],JobName: "Vox" , Descreption: "Add the job Descreption" , Responsibilites: "Add the job Responsibilites" , Requirements: "Add job Requirements" ,PositionName: "cashaer", NumOfEmploees: Int.random(in: 1...20) , Duration: Int.random(in: 1...20) , Salary: Double.random(in: 100.0...200.0) , JobType: .FullTime, CityOfTheJob: .Riyadh )
