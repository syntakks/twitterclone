//
//  AuthViewModel.swift
//  twitterclone
//
//  Created by Steve Wall on 5/18/21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
  
  func login() {
    
  }
  
  func registerUser(
    email: String,
    password: String,
    username: String,
    fullname: String,
    profileImage: UIImage) {
    print("DEBUG: email \(email)")
    print("DEBUG: password \(password)")
    Auth.auth().createUser(withEmail: email, password: password) { result, error in
      if let error = error {
        print("DEBUG: Error \(error.localizedDescription)")
        return
      }
      
      print("DEBUG: Successfully signed up user...")
    }
  }
  
}
