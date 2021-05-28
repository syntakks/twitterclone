//
//  User.swift
//  twitterclone
//
//  Created by Steve Wall on 5/18/21.
//

import Firebase
import Kingfisher

struct User: Identifiable, Hashable {
  
  static func == (lhs: User, rhs: User) -> Bool {
    lhs.id == rhs.id
  }
  
  let id: String
  let email: String
  let username: String
  let fullname: String
  let profileImageUrl: String
  var stats: UserStats
  var isFollowed = false
  
  var isCurrentUser: Bool {
    Auth.auth().currentUser?.uid == self.id
  }
  
  init(dictionary: [String : Any]) {
    self.id = dictionary["uid"] as? String ?? ""
    self.email = dictionary["email"] as? String ?? ""
    self.username = dictionary["username"] as? String ?? ""
    self.fullname = dictionary["fullname"] as? String ?? ""
    self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
    self.stats = UserStats(followers: 0, following: 0)
  }
}

let MOCK_USER = User(dictionary: [
  "uid": "123456",
  "email": "elonmusk@spacex.com",
  "username": "thadogefather",
  "fullname": "Elon Musk",
  "profileImageUrl": "https://images.uncyclomedia.co/illogicopedia/en/thumb/8/89/Elon_musk.jpg/300px-Elon_musk.jpg"
])

struct UserStats: Hashable {
  var followers: Int
  var following: Int
}
