//
//  TweetContentsView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/23/21.
//

import SwiftUI
import Kingfisher

struct TweetContentsView: View {
  @Environment(\.colorScheme) var colorScheme
  let tweet: Tweet
  
  var body: some View {
    HStack(alignment: .top, spacing: 12) {
      KFImage.url(URL(string: tweet.profileImageUrl)!)
        .circleImageStyle(size: 56, colorScheme: colorScheme)
      
      VStack(alignment: .leading, spacing: 4) {
        HStack {
          Text(tweet.fullname)
            .font(.system(size: 14, weight: .semibold))
          Group {
            Text("@\(tweet.username) •")
            Text(tweet.timestampString)
          }
          .foregroundColor(.gray)
        }
        
        Text(tweet.caption)
      }
      
    }
    .padding(.bottom)
    .padding(.trailing)
  }
}

struct TweetContentsView_Previews: PreviewProvider {
  static var previews: some View {
    TweetContentsView(tweet: MOCK_TWEET)
  }
}
