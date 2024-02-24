import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showingAlert = false
    @State private var showingSheet = false
    
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        Spacer()
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
                
                Section("Profile") {
                    ProfileDataView(imageName: "", title: "Birthdate: ", tintColor: .blue)
                    Text("Height: ")
                    Text("Weight: ")
                }
                
                Section("Account") {
                    Button {
                        showingSheet.toggle()
                    } label: {
                        SettingsRowView(imageName: "pencil.circle.fill", title: "Edit profile", tintColor: .blue)
                    }
                    
                    Button {
                        viewModel.signOut()
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor: .red)
                    }
                    
                    Button {
                        showingAlert = true
                    } label: {
                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete account", tintColor: .red)
                    }
                }
            }
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Delete Account"),
                    message: Text("Are you sure you want to delete your account? This action cannot be undone."),
                    primaryButton: .destructive(Text("Delete")) {
                        deleteAccount()
                    },
                    secondaryButton: .cancel()
                )
            }
            .sheet(isPresented: $showingSheet) {
                EditProfileSheetView()
            }
        }
    }
    
    private func deleteAccount() {
        viewModel.deleteAccount { success in
            if success {
                // Handle successful deletion (e.g., navigate to login screen)
            } else {
                // Handle deletion failure (e.g., display error message)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
