//
//  AuthViewModel.swift
//  twitterclone
//
//  Created by Steve Wall on 5/18/21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
  @Published var userSession: FirebaseAuth.User?
  @Published var isAuthenticating = false
  @Published var error: Error?
  @Published var user: User?
  
  static let shared = AuthViewModel()
  
  init() {
    // User object or nil -> not logged in.
    userSession = Auth.auth().currentUser
    // Populate User
    fetchUser()
  }
  
  func login(withEmail email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password) { result, error in
      if let error = error {
        print("DEBUG: Failed to login: \(error.localizedDescription)")
        return
      }
      self.userSession = result?.user
      self.fetchUser()
    }
  }
  
  func registerUser(
    email: String,
    password: String,
    username: String,
    fullname: String,
    profileImage: UIImage) {
    // Upload Image
    guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
    let filename = NSUUID().uuidString
    let storageRef = Storage.storage().reference().child(filename)
    // Push Image Data up to Firebase Storage Reference
    storageRef.putData(imageData, metadata: nil) { _, error in
      if let error = error {
        print("DEBUG: Failed to upload image \(error.localizedDescription)")
        return
      }
      // Get the URL for the Image
      storageRef.downloadURL { url, error in
        guard let profileImageUrl = url?.absoluteString else { return }
        // Now that we have an image, create the user
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
          if let error = error {
            print("DEBUG: Error \(error.localizedDescription)")
            return
          }
          // Get user from result
          guard let user = result?.user else { return }
          // Create Dict for Firestore
          let data =  [
            "uid": user.uid,
            "email": email,
            "username": username,
            "fullname": fullname,
            "profileImageUrl": profileImageUrl,
          ]
          // Upload to users > uid > data
          Firestore.firestore().collection("users").document(user.uid).setData(data) { error in
            if let error = error {
              print("DEBUG: Failed to upload data to Firestore: \(error.localizedDescription)")
              return
            }
            self.userSession = user
            self.fetchUser()
          }
        }
      }
    }
  }
  
  func signOut() {
    userSession = nil
    user = nil
    try? Auth.auth().signOut()
  }
  
  func fetchUser() {
    // Get UUID for user
    guard let uid = userSession?.uid else { return }
    // Search users > uid > document
    Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
      guard let data = snapshot?.data() else { return }
      let user = User(dictionary: data)
      self.user = user
    }
  }
  
}
