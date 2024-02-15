//
//  athleteiq_iosApp.swift
//  athleteiq-ios
//
//  Created by Mike Iannotti on 2/8/24.
//

import SwiftUI
import Firebase

@main
struct athleteiq_iosApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
