//
//  FeedView.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/17/21.
//

import SwiftUI

struct FeedView: View {
  @Environment(\.colorScheme) var colorScheme
  @ObservedObject var viewModel = FeedViewModel()
  @State var isShowingNewTweetView = false
  
  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      
      ScrollView {
        LazyVStack {
          ForEach(viewModel.tweets) { tweet in
            NavigationLink(
              destination: TweetDetailView(tweet: tweet)) {
              TweetCell(tweet: tweet)
                .foregroundColor(colorScheme == .dark ? .white : .black)
            }
          }
        }
      }
      
      Button(
        action: { isShowingNewTweetView.toggle() },
        label: {
          Image("tweet")
            .resizable()
            .renderingMode(.template)
            .frame(width: 32, height: 32)
            .padding()
        })
        .background(Color.blue)
        .foregroundColor(.white)
        .clipShape(Circle())
        .padding()
        .fullScreenCover(isPresented: $isShowingNewTweetView) {
          NewTweetView(isPresented: $isShowingNewTweetView)
        }
    }
  }
  
}

struct FeedView_Previews: PreviewProvider {
  static var previews: some View {
    FeedView()
  }
}
