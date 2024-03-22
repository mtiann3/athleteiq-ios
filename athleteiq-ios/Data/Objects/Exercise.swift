//
//  Exercise.swift
//  athleteiq-ios
//
//  Created by Mike Iannotti on 3/21/24.
//

import Foundation

struct Exercise: Codable {
    let date: Date
    let name: String
    let weight: Int
    let repetitions: Int
    let sets: Int
}
