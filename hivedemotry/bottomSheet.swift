//
//  bottomSheet.swift
//  hivedemotry
//
//  Created by leena alajlani on 29/05/2023.
//


import SwiftUI

struct bottomSheet: View {
    @State private var isPresentingDateSelectionSheet = false
    @State private var startDate = Date()
    @State private var endDate = Date()

    var body: some View {
        VStack {
            Button(action: {
                isPresentingDateSelectionSheet.toggle()
            }) {
                Text("Select Dates")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $isPresentingDateSelectionSheet) {
                DateSelectionView(startDate: $startDate, endDate: $endDate, isPresented: $isPresentingDateSelectionSheet)
            }
            Spacer()
        }
        .padding()
    }
}

struct DateSelectionView: View {
    @Binding var startDate: Date
    @Binding var endDate: Date
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Start Date", selection: $startDate, displayedComponents: [.date])
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                DatePicker("End Date", selection: $endDate, displayedComponents: [.date])
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                Spacer()
                Button(action: {
                    isPresented.toggle()
                }) {
                    Text("Done")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Select Dates")
        }
    }
}
struct bottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        bottomSheet()
    }
}
