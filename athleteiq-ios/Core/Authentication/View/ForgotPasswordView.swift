import SwiftUI

struct ForgotPasswordView: View {
    @State private var email = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            TextField("Enter your email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)

            Button(action: {
                viewModel.resetPassword(forEmail: email) { result in
                    switch result {
                    case .success:
                        showAlert = true
                        alertMessage = "An email with password reset instructions has been sent to \(email)."
                    case .failure(let error):
                        showAlert = true
                        alertMessage = "Password reset error: \(error.localizedDescription)"
                    }
                }
            }) {
                Text("Reset Password")
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Password Reset"),
                      message: Text(alertMessage),
                      dismissButton: .default(Text("OK")))
            }
        }
        .padding()
        .navigationTitle("Forgot Password")
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
