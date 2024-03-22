import SwiftUI

struct EditProfileSheetView: View {
    @Environment(\.dismiss) var dismiss
    @State private var newValue: String = "" // New value to be edited
    @State private var showingDiscardAlert = false
    var firestoreData: String // Replace YourFirestoreDataType with your actual type

    // Placeholder strings for different data types
    let fullNamePlaceholder = "Enter new full name"
    let birthdatePlaceholder = "XX-XX-XXXX"
    let weightPlaceholder = "Enter updated weight"
    let heightPlaceholder = "Enter updated height"
    let defaultValuePlaceholder = "Enter new value"


    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        if firestoreData == "fullName" {
                            InputView(text: $newValue, title: "New Full Name", placeholder: fullNamePlaceholder)
                                .autocapitalization(.none)
                        } else if firestoreData == "Birthdate" {
                            InputView(text: $newValue, title: "New Birthdate", placeholder: birthdatePlaceholder)
                                .autocapitalization(.none)
                        } else if firestoreData == "Height" {
                            InputView(text: $newValue, title: "New Height", placeholder: heightPlaceholder)
                                .autocapitalization(.none)
                        } else if firestoreData == "Weight" {
                            InputView(text: $newValue, title: "New Weight", placeholder: weightPlaceholder)
                                .autocapitalization(.none)
                        } else {
                            InputView(text: $newValue, title: "New Value", placeholder: defaultValuePlaceholder)
                                .autocapitalization(.none)
                        }
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
                    updateFirestoreData()
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
            .interactiveDismissDisabled()
        }
    }

    private func updateFirestoreData() {
        // Implement functionality to update Firestore data
        // You need to update the specific field of your Firestore document
        // using the new value (newValue) provided by the user
    }
}
