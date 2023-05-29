//
//  ADDjobView_cuurct.swift
//  hivedemotry
//
//  Created by leena alajlani on 29/05/2023.
//

import SwiftUI
import PhotosUI


class ADDjobView_cuurctModel: ObservableObject{
    @Published var addjob = AddJob()
    @Published var images: [UIImage] = []
    @Published var selection: [PhotosPickerItem] = []
}
struct ADDjobView_cuurct: View {
    
    @State private var durationString = ""
    @State private var salaryString = ""


    
    @State private var text = ""
    let characterLimit = 200
    
    @StateObject var viewModel = ADDjobView_cuurctModel ()
    static let gradientStart = Color("FFF3C3")
    static let gradientEnd = Color("C4B383")
    
    let gradient = LinearGradient(
        gradient: Gradient(
            colors: [
                Color("A48B40"),
                Color("FEE591")
                
            ]
        ),
        startPoint: .leading,
        endPoint: .trailing
    )

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView{
            ScrollView{
 //-----------------------------------------------------------------------------
                
                
                VStack(spacing: 25){
                    Text("vox")
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                    Spacer()
                        .frame(height: 0)
                    
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
                        //empty frame for it, for now
                        VStack{
                            HStack{
                                VStack{
                                    //where the image goes
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1)
                                        .frame(width: 69, height: 69)
                                    Spacer()
                                        .frame(height: 3)
                                    Image(systemName: "trash")
                                        .font(.system(size: 14))
                                        .foregroundColor(.red)
                                        .frame(width: 69 , height: 18)
                                        .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.red , lineWidth: 1))
                                }

                                Spacer()
                                    .frame(width: 15)
                                VStack(alignment: .leading){
                                    //job name
                                    TextField("", text: $viewModel.addjob.JobName, prompt: Text("Job name")
                                        .foregroundColor(.black))
                                    .font(.system(size: 24))
                                    .frame(width: 164)
                                    
                                    //type city district
                                    HStack(spacing: 8){
                                        //type
                                        Menu {
                                            ForEach(JobType.allCases, id:\.self){ city in
                                                Button {
                                                    viewModel.addjob.JobType = city
                                            } label: {
                                                    Text(city.title)
                                                }
                                            }
                                        } label: {
                                                ZStack{
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .foregroundColor(Color("C4B383"))

                                                    Text(viewModel.addjob.JobType.title)
                                                        .fontWeight(.regular)
                                                        .foregroundColor(Color.black)
                                                        .font(.system(size: 12))
                                                }
                                                .frame(width: 63, height: 20)
                                        }
                                        
                                        //city
                                        Menu {
                                            ForEach(CityOfTheJob.allCases, id:\.self){ city in
                                                Button {
                                                    viewModel.addjob.CityOfTheJob = city
                                                } label: {
                                                    Text(city.title)
                                                }
                                            }
                                        } label: {
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 8)
                                                    .foregroundColor(Color("C4B383"))
                                                Text(viewModel.addjob.CityOfTheJob.title)
                                                    .fontWeight(.regular)
                                                    .foregroundColor(Color.black)
                                                    .font(.system(size: 12))
                                            }
                                            .frame(width: 63, height: 20)

                                        }
                                        
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
                                .padding(.bottom, 30)

                                    
                            }
                            
                            HStack{
                                VStack{
                                    
                                    HStack{
                                        Image(systemName: "calendar")
                                        Text("Date")
                                    }
                                    .foregroundColor(Color("A48B40"))
                                    .fontWeight(.semibold)
                                    Spacer()
                                        .frame(height: 15)
                                    HStack{
                                        Image(systemName: "clock")
                                        Text("Time")
                                    }
                                    .foregroundColor(Color("A48B40"))
                                    .fontWeight(.semibold)
                                }
                                Spacer()
                                    .frame(width: 110)
                                VStack{
                                    
                                    //duration
                                    TextField(" ", text: $durationString, prompt: Text("Duration")
                                        .foregroundColor(Color("A48B40")))
                                    .font(.system(size: 16))
                                    .frame(width: 110)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("A48B40"))
                                    .keyboardType(UIKeyboardType.decimalPad)
                                    .onAppear {
                                        if viewModel.addjob.Duration == 0 {
                                            durationString = "" } else {durationString = String(viewModel.addjob.Duration)}}
                                    .onChange(of: durationString) { newValue in
                                        if let duration = Int(newValue) {viewModel.addjob.Duration = duration} else {viewModel.addjob.Duration = 0}}
                                    Spacer()
                                        .frame(height: 15)

                                    //salaryString
                                    //salary
                                    TextField("Salary", text: $salaryString, prompt: Text("Salary")
                                        .foregroundColor(Color("A48B40")))
                                    .font(.system(size: 16))
                                    .frame(width: 110)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("A48B40"))
                                    .keyboardType(UIKeyboardType.decimalPad)
                                    .onAppear {
                                        if viewModel.addjob.Salary == 0 {
                                            salaryString = "" } else {salaryString = String(viewModel.addjob.Salary)}}
                                    .onChange(of: salaryString) { newValue in
                                        if let salary = Int(newValue) {viewModel.addjob.Salary = Double(salary)} else {viewModel.addjob.Salary = 0}}
                                    

                                    
                                }
                            }
                        }
                
                    }
                    .frame(width: 145, height: 176)
                    //end of card
                    
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
                    
                    Spacer()
                        .frame(height: -10)
                    
                    //description
                    ZStack{
                        RoundedRectangle(cornerRadius: 28)
                            .fill(Color("FBFAF6"))
                            .frame(width: 345, height: 224)
                        VStack(alignment: .leading){
                            Text("Description")
                                .fontWeight(.bold)
                                .font(.system(size: 16))
                                .multilineTextAlignment(.leading)

                            TextField("", text: $viewModel.addjob.Descreption, prompt: Text("Add the job descreption …")
                                .foregroundColor(.black), axis: .vertical)
                                .padding(.leading, 0) // add left padding
                                .padding(.top, -60) // add top padding
                                .font(.system(size: 16))
                                .fontWeight(.thin)
                                .frame(width: 316, height: 123)
                                .multilineTextAlignment(.leading)

                            Text("\(characterLimit - viewModel.addjob.Descreption.count)/200")
                                .multilineTextAlignment(.trailing)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.top, -20)
                                .opacity(0.45)

                        }
                        .frame(width: 316)
                    }

                    
                    //responsibilities
                    ZStack{
                        RoundedRectangle(cornerRadius: 28)
                            .fill(Color("FBFAF6"))
                            .frame(width: 345, height: 224)
                        VStack(alignment: .leading){
                            Text("Responsibilities")
                                .fontWeight(.bold)
                                .font(.system(size: 16))
                                .multilineTextAlignment(.leading)

                            TextField("", text: $viewModel.addjob.Responsibilites, prompt: Text("Add the job responsibilites …")
                                .foregroundColor(.black), axis: .vertical)
                                .padding(.leading, 0) // add left padding
                                .padding(.top, -60) // add top padding
                                .font(.system(size: 16))
                                .fontWeight(.thin)
                                .frame(width: 316, height: 123)
                                .multilineTextAlignment(.leading)

                            Text("\(characterLimit - viewModel.addjob.Responsibilites.count)/200")
                                .multilineTextAlignment(.trailing)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.top, -20)
                                .opacity(0.45)

                        }
                        .frame(width: 316)
                    }

                    
                    //requirements
                    ZStack{
                        RoundedRectangle(cornerRadius: 28)
                            .fill(Color("FBFAF6"))
                            .frame(width: 345, height: 224)
                        VStack(alignment: .leading){
                            Text("Requirements")
                                .fontWeight(.bold)
                                .font(.system(size: 16))
                                .multilineTextAlignment(.leading)

                            TextField("", text: $viewModel.addjob.Requirements, prompt: Text("Add the job requirements …")
                                .foregroundColor(.black), axis: .vertical)
                                .padding(.leading, 0) // add left padding
                                .padding(.top, -60) // add top padding
                                .font(.system(size: 16))
                                .fontWeight(.thin)
                                .frame(width: 316, height: 123)
                                .multilineTextAlignment(.leading)
                            

                            Text("\(characterLimit - viewModel.addjob.Requirements.count)/200")
                                .multilineTextAlignment(.trailing)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.top, -20)
                                .opacity(0.45)
                        }
                        .frame(width: 316)
                    }
                    

                    //number of employees
                    ZStack{
                        Menu {
                            ForEach(JobType.allCases, id:\.self){ city in
                                Button {
                                    viewModel.addjob.JobType = city
                            } label: {
                                    Text(city.title)
                                }
                            }
                        } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 12)
                                        .foregroundColor(Color("FBFAF6"))
                                        .frame(width: 345, height: 49)


                                    Text("number of employees                    \(viewModel.addjob.JobType.title)")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 16))
                                        .multilineTextAlignment(.leading)
//                                        .padding(.trailing, 80)


                                }
                                .frame(width: 545, height: 49)
                        }
                    }

                    
                    
                    
                    
                    
                    // lazy1
                    LazyVGrid(columns: [GridItem.init(.adaptive(minimum: 140 ))]) {
                        //foreach1
                        ForEach(viewModel.images, id:\.self) { image in
                            //v5.1
                            VStack{
                               Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                           .frame(width: 69 , height: 69)
                           .clipShape(RoundedRectangle(cornerRadius: 12))
                              //button1
                                Button {
                                    withAnimation(.spring()){
                                        if let deletedPhoto = viewModel.images.firstIndex(of: image){
                                            viewModel.images.remove(at: deletedPhoto)
                                            
                                        }
                                    }
                                } label: {
                                    Image(systemName: "trash")
                                        .font(.system(size: 14))
                                        .foregroundColor(.red)
                                        .frame(width: 69 , height: 18)
                                        .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.red , lineWidth: 0.8)
                                        )
                                        
                                }
                                
                                //b1
                                
                            }.padding(.vertical , 8)
                            //v5.1
                        }
                        //foreach1
                        //photo picker max 1
                        PhotosPicker(selection: $viewModel.selection, maxSelectionCount: 1, matching: .images, preferredItemEncoding: .automatic ){
                            
                                                       //v5.2
                            VStack{
                        Image(systemName: "icloud.and.arrow.up")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40 , height: 40)
                            Label("Upload ", systemImage: "photo.stack")
                            }//v5.2
                            .frame(width: 180 , height: 180)
                            .overlay(
                             RoundedRectangle(cornerRadius: 5)
                             .strokeBorder(style: StrokeStyle(lineWidth: 0.2,dash:[10]))
                                                            )
                                                        
                            
                        }.onChange(of: viewModel.selection) { _ in
                            for item in viewModel.selection {
                                Task{
                                    if let data = try? await item.loadTransferable(type: Data.self){
                                        guard let uiImage = UIImage(data: data) else {return}
                                        viewModel.images.append(uiImage)
                                    }
                                }
                            }
                        }//photo picker
                    

                    }
                    // lazy1
                    .padding(.leading, 100.0)
                    
                    
                    //here i can add the submit button
                    Button{
//                 print("sksks \(addjob)")
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(gradient)
                            Text("Submit")
                                .foregroundColor(.white)
                                .font(.system(size: 21))
                        }
                    }
                    .frame(width: 333, height: 48)
                    
                    
                    
    
                }
                .padding(.top, -40)
            }
            
        }
       
        .navigationBarBackButtonHidden(true)

    }
}

struct ADDjobView_cuurct_Previews: PreviewProvider {
    static var previews: some View {
        ADDjobView_cuurct()
    }
}
