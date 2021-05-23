//
//  Tweet.swift
//  twitterclone
//
//  Created by Steve Wall on 5/23/21.
//

import Firebase
import Kingfisher

struct Tweet: Identifiable {
  let id: String
  let username: String
  let fullname: String
  let profileImageUrl: String
  let caption: String
  let likes: Int
  let uid: String
  let timestamp: Timestamp
  
  init(dictionary: [String : Any]) {
    self.id = dictionary["id"] as? String ?? ""
    self.caption = dictionary["caption"] as? String ?? ""
    self.username = dictionary["username"] as? String ?? ""
    self.fullname = dictionary["fullname"] as? String ?? ""
    self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
    self.likes = dictionary["likes"] as? Int ?? 0
    self.uid = dictionary["uid"] as? String ?? ""
    self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
  }
}

let MOCK_TWEET = Tweet(dictionary: [
  "id": 1234,
  "caption": "Hey this is a mock tweet!",
  "username": "fox",
  "fullname": "Foxy Fox",
  "profileImageUrl": "https://gif-avatars.com/img/200x200/fox.gif",
  "likes": 50,
  "uid": "hAslvnwI6FMXPglmXjHfwwCVCmr2",
  "timestamp": Timestamp(date: Date())
])
