//
//  User.swift
//  twitterclone
//
//  Created by Steve Wall on 5/18/21.
//

import Firebase
import Kingfisher

struct User: Identifiable {
  let id: String
  let email: String
  let username: String
  let fullname: String
  let profileImageUrl: String
  
  var isCurrentUser: Bool {
    Auth.auth().currentUser?.uid == self.id
  }
  
  init(dictionary: [String : Any]) {
    self.id = dictionary["uid"] as? String ?? ""
    self.email = dictionary["email"] as? String ?? ""
    self.username = dictionary["username"] as? String ?? ""
    self.fullname = dictionary["fullname"] as? String ?? ""
    self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
  }
}

let MOCK_USER = User(dictionary: [
  "uid": "123456",
  "email": "elonmusk@spacex.com",
  "username": "thadogefather",
  "fullname": "Elon Musk",
  "profileImageUrl": "https://images.uncyclomedia.co/illogicopedia/en/thumb/8/89/Elon_musk.jpg/300px-Elon_musk.jpg"
])

