//
//  FirebaseHelper.swift
//  twitterclone
//
//  Created by Steve Wall on 5/18/21.
//

import Firebase

/// This enum allows for easy fetch of document collections
enum FS: String, CaseIterable {
  case followers
  case following
  case messages
  case tweets
  case users
  
  /// Returns collection of given enum name
  func collection() ->  CollectionReference {
    return Firestore.firestore().collection(self.rawValue)
  }
  
}


