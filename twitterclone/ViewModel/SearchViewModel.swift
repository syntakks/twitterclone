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
    FS.users.fetch().getDocuments { snapshot, error in
      guard let documents = snapshot?.documents else { return }
      self.users = documents.map { User(dictionary: $0.data()) }
    }
  }
}
