//
//  model.swift
//  hivedemotry
//
//  Created by leena alajlani on 29/05/2023.
//

import Foundation
import SwiftUI

// this 1enum is for The type of the job wather its fullTime or partTime & The color
enum JobType : String, CaseIterable, Codable {
    case PartTime
    case FullTime
    
    var title: String {
    switch self{
case .PartTime : return "PartTime"
case .FullTime : return "FullTime"
}
}
    
    var JobTypeColor: Color {
    switch self{
case .PartTime : return .black
case .FullTime : return .black
}
}
    
}
//---------------------------------------------



// this 2enum is for the City of the job & the color
enum CityOfTheJob : String, CaseIterable, Codable{
    case Riyadh , Jeddah , Mecca , Medina , Dammam , Taif , AlQasim , Abha , Yanbu , AlKhobar , Hail , AlBahah , Jizan
    
    
    var title : String {
        switch self{
        case .Riyadh        : return "Riyadh"
        case .Jeddah        : return "Jeddah"
        case .Mecca         : return "Mecca"
        case .Medina        : return "Medina"
        case .Dammam        : return "Dammam"
        case .Taif          : return "Taif"
        case .AlQasim       : return "AlQasim"
        case .Abha          : return "Abha"
        case .Yanbu         : return "Yanbu"
        case .AlKhobar      : return "AlKhobar"
        case .Hail          : return "Hail"
        case .AlBahah       : return "AlBahah"
        case .Jizan         : return "Jizan"
        }
    }
    
    var CityOfTheJobColor: Color {
        switch self{
        case .Riyadh   : return .black
        case .Jeddah   : return .black
        case .Mecca    : return .black
        case .Medina   : return .black
        case .Dammam   : return .black
        case .Taif     : return .black
        case .AlQasim  : return .black
        case .Abha     : return .black
        case .Yanbu    : return .black
        case .AlKhobar : return .black
        case .Hail     : return .black
        case .AlBahah  : return .black
        case .Jizan    : return .black
}
}
    
}

//---------------------------------------------

// this 3enum is for the Time of the job & the color






















// The main struct for adding a job

struct AddJob: Codable, Equatable, Identifiable{
    static func == (lhs: AddJob, rhs: AddJob ) -> Bool {
    return lhs.id == rhs.id
}
    //varible
    var id = UUID().uuidString
    var CompanyImage: [String] = []
    var JobName: String = ""
    var Descreption: String = ""
    var Responsibilites: String = ""
    var Requirements: String = ""
    var PositionName: String = ""
    var NumOfEmploees: Int = 0
    var Duration: Int = 0
    var Salary: Double = 0.0
    var Stob : Bool = false
    // enum
    var JobType: JobType = .FullTime
    var CityOfTheJob: CityOfTheJob = .AlBahah
    // missing "Date" + "Time"
    
    
    
    
    
    
}
