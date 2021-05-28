//
//  SearchViewModel.swift
//  twitterclone
//
//  Created by Steve Wall on 5/18/21.
//

import Foundation
import Firebase

enum SearchConfig {
  case search
  case newMessage
}

class SearchViewModel: ObservableObject {
  @Published var users = [User]()
  private let config: SearchConfig
  
  init(config: SearchConfig) {
    self.config = config
    fetchUsers(forConfig: config)
  }
  
  func fetchUsers(forConfig config: SearchConfig) {
    FS.users.collection().getDocuments { snapshot, error in
      guard let documents = snapshot?.documents else { return }
      let users = documents.map { User(dictionary: $0.data()) }
      switch config {
      case .newMessage:
        self.users = users.filter { !$0.isCurrentUser }
      case.search:
        self.users = users
      }
    }
  }
  
  func filteredUsers(_ query: String) -> [User] {
    return users.filter {
      $0.fullname.lowercased().contains(query.lowercased()) ||
        $0.username.contains(query.lowercased())
    }
  }
  
}
