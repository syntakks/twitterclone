//
//  UploadTweetViewModel.swift
//  twitterclone
//
//  Created by Steve Wall on 5/23/21.
//

import SwiftUI
import Firebase

class UploadTweetViewModel: ObservableObject {
  @Binding var isPresented: Bool
  
  init(isPresented: Binding<Bool>) {
    self._isPresented = isPresented
  }
  
  func uploadTweet(caption: String) {
    guard let user = AuthViewModel.shared.user else { return }
    let docRef = FS.tweets.collection().document()
    
    let data: [String: Any] = [
      "uid" : user.id,
      "caption": caption,
      "fullname": user.fullname,
      "timestamp": Timestamp(date: Date()),
      "username": user.username,
      "profileImageUrl": user.profileImageUrl,
      "likes": 0,
      "id": docRef.documentID
    ]
    
    docRef.setData(data) { error in
      if let error = error {
        print("ERROR: Uploading tweet: \(error.localizedDescription)")
      }
      self.isPresented = false
    }
  }
  
}
