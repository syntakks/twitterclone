//
//  SearchViewModel.swift
//  twitterclone
//
//  Created by Steve Wall on 5/18/21.
//

import Foundation
import Firebase

class SearchViewModel: ObservableObject {
  @Published var users = [User]()
  
  init() {
    fetchUsers()
  }
  
  func fetchUsers() {
    FS.users.collection().getDocuments { snapshot, error in
      guard let documents = snapshot?.documents else { return }
      self.users = documents.map { User(dictionary: $0.data()) }
    }
  }
  
  func filteredUsers(_ query: String) -> [User] {
    return users.filter {
      $0.fullname.lowercased().contains(query.lowercased()) ||
        $0.username.contains(query.lowercased())
    }
  }
  
}
