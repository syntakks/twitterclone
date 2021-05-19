//
//  ProfileViewModel.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/19/21.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
  @Published var isFollowed = false
  let user: User
  
  init(user: User) {
    self.user = user
    print(user.profileImageUrl)
  }
  
  func follow() {
    guard let currentUid = Auth.auth().currentUser?.uid else { return }
    // Add followee to current users "user-following" collection
    FS.following.collection().document(currentUid).collection("user-following")
      .document(self.user.id).setData([:]) { _ in
        // Add follower to followee's "user-followers" collection
        FS.followers.collection().document(self.user.id).collection("user-followers")
          .document(currentUid).setData([:]) { _ in
            self.isFollowed = true
          }
        
      }
  }
  
  func unfollow() {
    
  }
  
}
