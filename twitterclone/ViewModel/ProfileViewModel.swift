//
//  ProfileViewModel.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/19/21.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
  @Published var user: User
  @Published var userTweets = [Tweet]()
  @Published var likedTweets = [Tweet]()
  
  init(user: User) {
    self.user = user
    checkIfUserIsFollowed()
    fetchUserTweets()
    fetchLikedTweets()
    fetchUserStats()
  }
  
  func tweets(by filterOption: TweetFilterOptions) -> [Tweet] {
    switch(filterOption) {
    case .tweets: return userTweets
    case .likes: return likedTweets
    }
  }
}

enum TweetFilterOptions: Int, CaseIterable {
  case tweets
  //case replies
  case likes
  
  var title: String {
    switch self {
    // User Tweets
    case .tweets: return "Tweets"
    // Liked Tweets
    case .likes: return "Likes"
    }
  }
}

// MARK: - API Calls
extension ProfileViewModel {
  func getCurrentUid() -> String? {
    return Auth.auth().currentUser?.uid
  }
  
  /// Returns reference for "user-following" collection
  func followingRef(id currentUid: String) -> CollectionReference {
    return FS.following.collection().document(currentUid).collection("user-following")
  }
  
  /// Returns reference for "user-followers" collection
  func followersRef() -> CollectionReference {
    FS.followers.collection().document(self.user.id).collection("user-followers")
  }
  
  /// Adds following and followers between users
  func follow() {
    guard let currentUid = getCurrentUid() else { return }
    // Add followee to current users "user-following" collection
    followingRef(id: currentUid).document(self.user.id).setData([:]) { _ in
      // Add current user to followee's "user-followers" collection
      self.followersRef().document(currentUid).setData([:]) { _ in
        self.user.isFollowed = true
      }
    }
  }
  
  /// Removes following and followers between users
  func unfollow() {
    guard let currentUid = getCurrentUid() else { return }
    // Remove followee from current users "user-following" collection
    followingRef(id: currentUid).document(self.user.id).delete() { _ in
      // Remove current user from followee's "user-followers" collection
      self.followersRef().document(currentUid).delete() { _ in
        self.user.isFollowed = false
      }
    }
  }
  
  /// Checks Firebase to see if we are following a given user.
  func checkIfUserIsFollowed() {
    // Don't run this for current user.
    guard !user.isCurrentUser else { return }
    guard let currentUid = getCurrentUid() else { return }
    followingRef(id: currentUid).getDocuments { snapshot, _ in
      if let snapshot = snapshot {
        if snapshot.isEmpty { return }
        self.user.isFollowed = snapshot.documents.filter {
          $0.documentID == self.user.id
        }.count > 0
      }
    }
  }
  
  func fetchUserTweets() {
    FS.tweets.collection().whereField("uid", isEqualTo: user.id).getDocuments { snapshot, error in
      guard let documents = snapshot?.documents else { return }
      self.userTweets = documents.map { Tweet(dictionary: $0.data()) }
    }
  }
  
  func fetchLikedTweets() {
    var tweets = [Tweet]()
    // Fetch tweet ids
    FS.users.collection().document(user.id).collection("user-likes").getDocuments { snapshot, error in
      guard let documents = snapshot?.documents else { return }
      let tweetIds = documents.map { $0.documentID }
      // fetch tweet for id
      tweetIds.forEach { id in
        FS.tweets.collection().document(id).getDocument { snapshot, error in
          guard let data = snapshot?.data() else { return }
          let tweet = Tweet(dictionary: data)
          tweets.append(tweet)
          guard tweets.count == tweetIds.count else { return }
          self.likedTweets = tweets
        }
      }
    }
  }
  
  func fetchUserStats() {
    let followersRef = FS.followers.collection().document(user.id).collection("user-followers")
    let followingRef = FS.following.collection().document(user.id).collection("user-following")
    
    followersRef.getDocuments { snapshot, error in
      let followersCount = snapshot?.documents.count ?? 0
      followingRef.getDocuments { snapshot, error in
        let followingCount = snapshot?.documents.count ?? 0
        self.user.stats = UserStats(followers: followersCount, following: followingCount)
      }
    }
  }
  
}
