import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showingSheet = false
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ProfileView()
                    .sheet(isPresented: $showingSheet) {
                        EditProfileSheetView()
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                showingSheet.toggle()
                            }) {
                                Image(systemName: "square.and.pencil")
                                    .imageScale(.large)
                            }
                        }
                    }
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
