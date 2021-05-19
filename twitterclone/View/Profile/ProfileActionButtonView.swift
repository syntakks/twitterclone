//
//  ProfileActionButtonView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct ProfileActionButtonView: View {
  let viewModel: ProfileViewModel
  @Binding var isFollowed: Bool
  
  var body: some View {
    if viewModel.user.isCurrentUser {
      Button("Edit", action: {})
        .buttonStyle(EditButtonStyle())
    } else {
      HStack {
        Button(
          isFollowed ? "Following" : "Follow",
          action: {
          isFollowed ? viewModel.unfollow() : viewModel.follow()
        })
        .buttonStyle(FollowButtonStyle())
        
        Button("Message", action: {})
          .buttonStyle(MessageButtonStyle())
      }
    }
    
  }
}

struct ProfileActionButtonView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      ProfileActionButtonView(viewModel: ProfileViewModel(user: MOCK_USER), isFollowed: .constant(false))
    }
  }
}
