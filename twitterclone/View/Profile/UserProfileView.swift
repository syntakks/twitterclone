//
//  UserProfileView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct UserProfileView: View {
  @ObservedObject var viewModel: ProfileViewModel
  @State var selectedFilter: TweetFilterOptions = .tweets
  let user: User
  
  init(user: User) {
    self.user = user
    self.viewModel = ProfileViewModel(user: user)
  }
  
  var body: some View {
    ScrollView {
      VStack {
        ProfileHeaderView(viewModel: viewModel, isFollowed: $viewModel.isFollowed)
        FilterButtonView(selectedOption: $selectedFilter)
      }
      
      ForEach(tweets(by: selectedFilter)) { tweet in
        TweetCell(tweet: tweet)
      }
      
      .navigationTitle(user.username)
    }
  }
  
  func tweets(by filterOption: TweetFilterOptions) -> [Tweet] {
    switch(filterOption) {
    case .tweets: return viewModel.userTweets
    case .likes: return viewModel.likedTweets
    }
  }
}

struct UserProfileView_Previews: PreviewProvider {
  static var previews: some View {
    UserProfileView(user: MOCK_USER)
  }
}
