import SwiftUI

struct EditProfileSheetView: View {
    @Environment(\.dismiss) var dismiss
    @State private var height = ""
    @State private var weight = ""
    @State private var birthdate = ""
    
    @State private var showingDiscardAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Edit Value")
                    .font(.title)
                    .padding()
                
                Spacer()
                List {
                    Section {
                        InputView(text: $birthdate, title: "New Value", placeholder: "")
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
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
            .interactiveDismissDisabled()
        }
    }
}

struct EditProfileSheet_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileSheetView()
    }
}
