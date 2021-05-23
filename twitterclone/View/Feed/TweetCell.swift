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
        HStack(alignment: .top, spacing: 12) {
          KFImage.url(URL(string: tweet.profileImageUrl)!)
            .circleImageStyle(size: 56, colorScheme: colorScheme)
          
          VStack(alignment: .leading, spacing: 4) {
            HStack {
              Text(tweet.fullname)
                .font(.system(size: 14, weight: .semibold))
              Group {
                Text("@\(tweet.username) •")
                Text("2w")
              }
              .foregroundColor(.gray)
            }
            
            Text(tweet.caption)
          }
          
        }
        .padding(.bottom)
        .padding(.trailing)
        
        TweetToolbarView()
        
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

struct TweetToolbarView: View {
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
      
      Button(
        action: {},
        label: {
          Image(systemName: "heart.fill")
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
}
