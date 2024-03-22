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
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showingSheet.toggle()
                        }) {
                            Image(systemName: "pencil.circle.fill")
                                .font(.title)
                                .foregroundColor(.blue)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.vertical, 8)
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
                    ProfileDataView(title: "Birthdate", value: user.birthdate != nil ? "\(String(describing: user.birthdate))" : "Not set", tintColor: .blue, editable: true, image: "pencil.circle.fill")
                    
                    ProfileDataView(title: "Height", value: user.height != 0 ? "\(user.height)" : "Not set",tintColor: .blue, editable: true, image: "plus.circle.fill")
                    
//                    ProfileDataView(title: "Weight", value: user.w != nil ? formatDate(user.birthdate!) : "Not set",, editable: true, image: "plus.circle.fill")
                }



                Section("Account") {
                   
                    
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
                EditProfileSheetView(firestoreData: "fullName")
                    .presentationDetents([.medium])
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
    
    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
