//
//  ProfileActionButtonView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct ProfileActionButtonView: View {
  @ObservedObject var viewModel: ProfileViewModel
  
  var body: some View {
    if viewModel.user.isCurrentUser {
      Button("Edit", action: {})
        .buttonStyle(EditButtonStyle())
    } else {
      HStack {
        Button(
          viewModel.user.isFollowed ? "Following" : "Follow",
          action: {
            viewModel.user.isFollowed ? viewModel.unfollow() : viewModel.follow()
          })
          .buttonStyle(FollowButtonStyle())
        
        NavigationLink(
          destination: ChatView(user: viewModel.user)) {
          Text("Message")
            .messageButtonTextStyle()
        }
      }
    }
  }
}

struct ProfileActionButtonView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      ProfileActionButtonView(viewModel: ProfileViewModel(user: MOCK_USER))
    }
  }
}
