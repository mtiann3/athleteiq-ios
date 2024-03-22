//
//  User.swift
//  athleteiq-ios
//
//  Created by Mike Iannotti on 2/14/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var fullName: String
    let email: String
    let birthdate: Date?
    var height: Int
//    var weight: Array<Weight>
    var exercises: Array<Exercise>
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
            
    }
}

//extension User {
//    static var MOCK_USER = User(id: NSUUID().uuidString, fullName: "Kobe Bryant", email: "test@gmail.com")
//}
