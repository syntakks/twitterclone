//
//  ChatViewModel.swift
//  twitterclone
//
//  Created by Steve Wall on 5/24/21.
//

import SwiftUI
import Firebase

class ChatViewModel: ObservableObject {
  let user: User
  @Published var messages = [Message]()
  
  init(user: User) {
    self.user = user
    fetchMessages()
  }
  
  func fetchMessages() {
    guard let uid = AuthViewModel.shared.userSession?.uid else { return }
    let query = FS.messages.collection().document(uid).collection(user.id)
    
    query.addSnapshotListener { snapshot, error in
      guard let changes = snapshot?.documentChanges else { return }
      
      changes.forEach { change in
        let messageData = change.document.data()
        guard let fromId = messageData["fromId"] as? String else { return }
        
        FS.users.collection().document(fromId).getDocument { snapshot, error in
          guard let data = snapshot?.data() else { return }
          let user = User(dictionary: data)
          
          self.messages.append(Message(user: user, dictionary: messageData))
          self.messages.sort { $0.timestamp.dateValue() < $1.timestamp.dateValue() }
        }
      }
    }
  }
  
  func sendMessage(_ messageText: String) {
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
