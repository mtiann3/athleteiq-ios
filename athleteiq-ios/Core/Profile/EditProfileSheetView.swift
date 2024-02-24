import SwiftUI

struct EditProfileSheetView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var showingDiscardAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Edit Profile")
                    .font(.title)
                    .padding()
                
                Spacer()
                List {
                    Section("Profile") {
                        Text("Birthdate: ")
                        Text("Height: ")
                        Text("Weight: ")
                    }
                }
            }
            .navigationBarItems(
                leading: Button(action: {
                    self.showingDiscardAlert = true
                }) {
                    Text("Cancel")
                        .foregroundColor(.red) // Customize color as needed
                },
                trailing: Button(action: {
                    // Perform action when Done is tapped
                    self.dismiss()
                }) {
                    Text("Done")
                        .foregroundColor(.blue) // Customize color as needed
                        .bold()
                }
            )
            .alert(isPresented: $showingDiscardAlert) {
                Alert(
                    title: Text("Discard Changes?"),
                    message: Text("Are you sure you want to discard your changes?"),
                    primaryButton: .default(Text("Keep Editing")),
                    secondaryButton: .destructive(Text("Discard Changes")) {
                        self.dismiss()
                    }
                )
            }
            
//            FIX THIS
//            .gesture(
//                DragGesture()
//                    .onChanged { gesture in
//                        // Check if user swiped down
//                        if gesture.translation.height > 50 {
//                            self.showingDiscardAlert = true
//                        }
//                    }
//            )
        }
    }
}

struct EditProfileSheet_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileSheetView()
    }
}
