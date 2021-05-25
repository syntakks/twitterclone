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
        ProfileHeaderView(viewModel: viewModel)
        FilterButtonView(selectedOption: $selectedFilter)
      }
      
      ForEach(viewModel.tweets(by: selectedFilter)) { tweet in
        TweetCell(tweet: tweet)
      }
      .navigationTitle(user.username)
    }
  }
}

struct UserProfileView_Previews: PreviewProvider {
  static var previews: some View {
    UserProfileView(user: MOCK_USER)
  }
}
