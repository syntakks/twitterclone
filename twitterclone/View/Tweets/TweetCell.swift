//
//  TweetCell.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/17/21.
//

import SwiftUI
import Kingfisher

struct TweetCell: View {
  @Environment(\.colorScheme) var colorScheme
  var tweet: Tweet
  
    var body: some View {
      VStack(alignment: .leading) {
        TweetContentsView(tweet: tweet)
        
        TweetToolbarView(tweet: tweet)
        
        Divider()
      }
      .padding(.top, 4)
    }
}

struct TweetCell_Previews: PreviewProvider {
    static var previews: some View {
      TweetCell(tweet: MOCK_TWEET)
    }
}
