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
    checkIfUserIsFollowed()
  }
  
  func getCurrentUid() -> String? {
    return Auth.auth().currentUser?.uid
  }
  
  /// Returns reference for "user-following" collection
  func followingRef(id currentUid: String) -> CollectionReference {
    return FS.following.collection().document(currentUid).collection("user-following")
  }
  
  /// Returns reference for "user-followers" collection
  func followersRef() -> CollectionReference {
    FS.followers.collection().document(self.user.id).collection("user-followers")
  }
  
  /// Adds following and followers between users
  func follow() {
    guard let currentUid = getCurrentUid() else { return }
    // Add followee to current users "user-following" collection
    followingRef(id: currentUid).document(self.user.id).setData([:]) { _ in
      // Add current user to followee's "user-followers" collection
      self.followersRef().document(currentUid).setData([:]) { _ in
        self.isFollowed = true
      }
    }
  }
  
  /// Removes following and followers between users
  func unfollow() {
    guard let currentUid = getCurrentUid() else { return }
    // Remove followee from current users "user-following" collection
    followingRef(id: currentUid).document(self.user.id).delete() { _ in
      // Remove current user from followee's "user-followers" collection
      self.followersRef().document(currentUid).delete() { _ in
        self.isFollowed = false
      }
    }
  }
  
  /// Checks Firebase to see if we are following a given user.
  func checkIfUserIsFollowed() {
    guard let currentUid = getCurrentUid() else { return }
    followingRef(id: currentUid).getDocuments { snapshot, _ in
      guard let isFollowed = snapshot?.isEmpty else { return }
      self.isFollowed = isFollowed
    }
  }
  
}
