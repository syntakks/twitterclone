//
//  TweetToolbarView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/23/21.
//

import SwiftUI

struct TweetToolbarView: View {
  let tweet: Tweet
  @ObservedObject var viewModel: TweetToolbarViewModel
  
  init(tweet: Tweet) {
    self.tweet = tweet
    self.viewModel = TweetToolbarViewModel(tweet: tweet)
  }
  
  var body: some View {
    HStack {
      
      Button(
        action: {},
        label: {
          Image(systemName: "bubble.left")
            .font(.system(size: 16))
            .frame(width:32, height: 32)
        })
      
      Spacer()
      
      Button(
        action: {},
        label: {
          Image(systemName: "arrow.2.squarepath")
            .font(.system(size: 16))
            .frame(width:32, height: 32)
        })
      
      Spacer()
      
      // Like button
      Button(
        action: viewModel.didLike ? unlikeTweet : likeTweet,
        label: {
          Image(systemName: viewModel.didLike ? "heart.fill" : "heart")
            .foregroundColor(.red)
            .font(.system(size: 16))
            .frame(width:32, height: 32)
        })
      
      Spacer()
      
      Button(
        action: {},
        label: {
          Image(systemName: "bookmark")
            .font(.system(size: 16))
            .frame(width:32, height: 32)
        })
    }
    .padding(.horizontal)
    .foregroundColor(.gray)
  }
  
  func likeTweet() {
    viewModel.likeTweet()
  }
  
  func unlikeTweet() {
    viewModel.unlikeTweet()
  }
  
}

struct TweetToolbarView_Previews: PreviewProvider {
    static var previews: some View {
      VStack {
        TweetToolbarView(tweet: MOCK_TWEET)
        Divider()
      }
    }
}
