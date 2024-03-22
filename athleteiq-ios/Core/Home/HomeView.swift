//
//  HomeView.swift
//  athleteiq-ios
//
//  Created by Mike Iannotti on 3/21/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        if let user = viewModel.currentUser {
            List{
                Section{
                    HStack {
                       
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Welcome, \(user.fullName)") 
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            
                        }
                        Spacer()
                    }
                }
            }
                
        }
    }
}

#Preview {
    HomeView()
}
