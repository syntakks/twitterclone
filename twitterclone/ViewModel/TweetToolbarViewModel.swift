//
//  TweetToolbarViewModel.swift
//  twitterclone
//
//  Created by Steve Wall on 5/23/21.
//

import SwiftUI
import Firebase

class TweetToolbarViewModel: ObservableObject {
  let tweet: Tweet
  @Published var didLike = false
  
  init(tweet: Tweet) {
    self.tweet = tweet
    checkIfUserLikedTweet()
  }
  
  /// This function will update the tweets > tweet: likes && tweets > tweet > tweet-likes > uid (The uid of who liked it)
  func likeTweet() {
    guard let uid = AuthViewModel.shared.userSession?.uid else { return }
    let tweetLikesRef = FS.tweets.collection().document(tweet.id).collection("tweet-likes")
    let userLikesRef = FS.users.collection().document(uid).collection("user-likes")
    // Update tweets > tweet: "likes"
    FS.tweets.collection().document(tweet.id).updateData(["likes" : tweet.likes + 1])
    // Update tweets > tweet > tweet-likes > uid
    tweetLikesRef.document(uid).setData([:]) { _ in
      // Update users > user > user-likes > tweet.id
      userLikesRef.document(self.tweet.id).setData([:]) { _ in
        self.didLike = true
      }
    }
  }
  
  func unlikeTweet() {
    guard let uid = AuthViewModel.shared.userSession?.uid else { return }
    let tweetLikesRef = FS.tweets.collection().document(tweet.id).collection("tweet-likes")
    let userLikesRef = FS.users.collection().document(uid).collection("user-likes")
    // Update tweets > tweet: "likes"
    FS.tweets.collection().document(tweet.id).updateData(["likes" : tweet.likes + 1])
    // delete tweets > tweet > tweet-likes > uid
    tweetLikesRef.document(uid).delete() { _ in
      // Update users > user > user-likes > tweet.id
      userLikesRef.document(self.tweet.id).delete() { _ in
        self.didLike = false
      }
    }
  }
  
  func checkIfUserLikedTweet() {
    guard let uid = AuthViewModel.shared.userSession?.uid else { return }
    let userLikesRef = FS.users.collection().document(uid).collection("user-likes").document(tweet.id)
    userLikesRef.getDocument { snapshot, error in
      guard let didLike = snapshot?.exists else { return }
      self.didLike = didLike
    }
  }
  
}
