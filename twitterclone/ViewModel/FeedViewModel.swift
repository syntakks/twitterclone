//
//  FeedViewModel.swift
//  twitterclone
//
//  Created by Steve Wall on 5/23/21.
//

import SwiftUI

class FeedViewModel: ObservableObject {
  @Published var tweets = [Tweet]()
  
  init() {
    fetchTweets()
  }
  
  func fetchTweets() {
    FS.tweets.collection().getDocuments { snapshot, error in
      guard let documents = snapshot?.documents else { return }
      self.tweets = documents.map { Tweet(dictionary: $0.data()) }
    }
  }
  
}
