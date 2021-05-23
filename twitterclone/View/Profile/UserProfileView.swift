//
//  UserProfileView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct UserProfileView: View {
  @ObservedObject var viewModel: ProfileViewModel
  @ObservedObject var feedViewModel = FeedViewModel()
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
      
      ForEach(feedViewModel.tweets) { tweet in
        TweetCell(tweet: tweet)
      }
      
      .navigationTitle("Batman")
    }
  }
}

struct UserProfileView_Previews: PreviewProvider {
  static var previews: some View {
    UserProfileView(user: MOCK_USER)
  }
}
