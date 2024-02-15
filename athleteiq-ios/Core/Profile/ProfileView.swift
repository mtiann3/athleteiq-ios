//
//  ProfileView.swift
//  athleteiq-ios
//
//  Created by Mike Iannotti on 2/14/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List{
            Section {
                HStack {
                    Text(User.MOCK_USER.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray3))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text(User.MOCK_USER.fullName)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        Text(User.MOCK_USER.email)
                            .font(.footnote)
                            .foregroundColor(.gray)
//                        if the text is a string, switch foregroundcolor                       to accent color.
                    }
                }
                
            }
            
            Section("General") {
                HStack {
                    SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                    
                    Spacer()
                    
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                }
            }
            
            Section("Account") {
                Button{
                    print("Sign out...")
                }label: {
                    SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor: .red)
                }
                Button{
                    print("Delete account...")
                }label: {
                    SettingsRowView(imageName: "xmark.circle.fill", title: "Delete account", tintColor: .red)
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
