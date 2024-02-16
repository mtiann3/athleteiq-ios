//
//  AuthViewModel.swift
//  athleteiq-ios
//
//  Created by Mike Iannotti on 2/14/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
    
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init(){
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullName: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut() // signs out user on backend
            self.userSession = nil // wipes out user session and takes us back to login screen
            self.currentUser = nil // wipes out current user data model
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount(completion: @escaping (Bool) -> Void) {
        // Perform the asynchronous deletion operation
        Task {
            do {
                // 1. Delete user document from Firestore
                if let uid = userSession?.uid {
                    try await Firestore.firestore().collection("users").document(uid).delete()
                }
                
                // 2. Delete user's account from Firebase Authentication
                try await Auth.auth().currentUser?.delete()
                
                // 3. Update local session and user data
                userSession = nil
                currentUser = nil
                
                completion(true) // Notify the caller that deletion is successful
            } catch {
                print("DEBUG: Failed to delete account with error \(error.localizedDescription)")
                completion(false) // Notify the caller that deletion failed
            }
        }
    }


    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else{ return}
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as: User.self)
    }
}
                        
