//
//  Tweet.swift
//  twitterclone
//
//  Created by Steve Wall on 5/23/21.
//

import Firebase

struct Tweet: Identifiable {
  let id: String
  let username: String
  let profileImageUrl: String
  let fullname: String
  let caption: String
  let likes: Int
  let uid: String
  let timestamp: Timestamp
  var replyingTo: String?
  
  init(dictionary: [String: Any]) {
    self.id = dictionary["id"] as? String ?? ""
    self.username = dictionary["username"] as? String ?? ""
    self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
    self.caption = dictionary["caption"] as? String ?? ""
    self.fullname = dictionary["fullname"] as? String ?? ""
    self.likes = dictionary["likes"] as? Int ?? 0
    self.uid = dictionary["uid"] as? String ?? ""
    self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
    self.replyingTo = dictionary["replyingTo"] as? String
  }
  
  var timestampString: String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
    formatter.maximumUnitCount = 1
    formatter.unitsStyle = .abbreviated
    return formatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
  }
  
  var detailedTimestampString: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mm a · MM/dd/yyyy"
    return formatter.string(from: timestamp.dateValue())
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
