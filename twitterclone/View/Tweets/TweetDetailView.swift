//
//  TweetDetailView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/23/21.
//

import SwiftUI
import Kingfisher

struct TweetDetailView: View {
  @Environment(\.colorScheme) var colorScheme
  let tweet: Tweet
  
  var body: some View {
    VStack(alignment: .leading) {
      TweetContentsView(tweet: tweet)
      TweetStatsView(tweet: tweet)
      TweetToolbarView(tweet: tweet)
      Divider()
    }
    .padding(.top)
    Spacer()
  }
}

struct TweetDetailView_Previews: PreviewProvider {
  static var previews: some View {
    TweetDetailView(tweet: MOCK_TWEET)
  }
}



struct TweetStatsView: View {
  let tweet: Tweet
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("7:22 PM • 05/23/2021")
        .font(.system(size: 14))
        .foregroundColor(.gray)
      Divider()
      HStack {
        HStack {
          Text("0")
            .font(.system(size: 14, weight: .semibold))
          Text("Retweets")
            .font(.system(size: 14))
            .foregroundColor(.gray)
        }
        HStack {
          Text("\(tweet.likes)")
            .font(.system(size: 14, weight: .semibold))
          Text("Likes")
            .font(.system(size: 14))
            .foregroundColor(.gray)
        }
      }
      Divider()
    }
    .padding(.leading, 8)
    .navigationTitle("Tweet Detail")
  }
}
