import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showingSheet = false
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                
                
                TabView{
                    HomeView()
                        .tabItem {
                            Label("Dashboard", systemImage: "house")
                        }
                    
                    
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person")
                        }                    .sheet(isPresented: $showingSheet) {
                            EditProfileSheetView(firestoreData: "fullName")
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

