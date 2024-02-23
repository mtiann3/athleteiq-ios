//
//  ProfileDataView.swift
//  athleteiq-ios
//
//  Created by Mike Iannotti on 2/23/24.
//

import SwiftUI

struct ProfileDataView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
        }
        
    }
}

struct ProfileDataView_Previews: PreviewProvider {
    static var previews: some View{
        ProfileDataView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
    }
}
