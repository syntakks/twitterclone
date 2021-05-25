//
//  ChatViewModel.swift
//  twitterclone
//
//  Created by Steve Wall on 5/24/21.
//

import SwiftUI
import Firebase

struct ChatViewModel {
  let user: User
  
  func fetchMessages() {
    
  }
  
  func sendMessage(_ messageText: String, to user: User) {
    guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
    let currentUserRef = FS.messages.collection().document(currentUid).collection(user.id).document()
    let messageID = currentUserRef.documentID
    let toUserRef = FS.messages.collection().document(user.id).collection(currentUid).document(messageID)
    let currentRecentRef = FS.messages.collection().document(currentUid).collection("recent-messages")
    let toRecentRef = FS.messages.collection().document(user.id).collection("recent-messages")
    
    let data: [String: Any] = [
      "text": messageText,
      "id": messageID,
      "fromId": currentUid,
      "toId": user.id,
      "timestamp": Timestamp(date: Date())
    ]
    
    currentUserRef.setData(data)
    toUserRef.setData(data)
    currentRecentRef.document(user.id).setData(data)
    toRecentRef.document(currentUid).setData(data)
    
  }
}
