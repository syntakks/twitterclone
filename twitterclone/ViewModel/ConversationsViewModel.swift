//
//  ConversationsViewModel.swift
//  twitterclone
//
//  Created by Steve Wall on 5/27/21.
//

import SwiftUI

class ConversationsViewModel: ObservableObject {
  @Published var recentMessages = [Message]()
  private var recentMessagesDictionary = [String: Message]()
  
  init() {
    fetchRecentMessages()
  }
  
  func fetchRecentMessages() {
    guard let uid = AuthViewModel.shared.userSession?.uid else { return }
    let query = FS.messages.collection().document(uid).collection("recent-messages")
    query.order(by: "timestamp", descending: true)
    
    query.addSnapshotListener { snapshot, error in
      guard let changes = snapshot?.documentChanges else { return }
      
      changes.forEach { change in
        let messageData = change.document.data()
        let uid = change.document.documentID
        
        FS.users.collection().document(uid).getDocument { snapshot, error in
          guard let data = snapshot?.data() else { return }
          let user = User(dictionary: data)
          self.recentMessagesDictionary[uid] = Message(user: user, dictionary: messageData)
          
          self.recentMessages = Array(self.recentMessagesDictionary.values)
        }
      }
    }
    
  }
}
