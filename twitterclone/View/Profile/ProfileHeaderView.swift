//
//  ProfileHeaderView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
  @Environment(\.colorScheme) var colorScheme
  @ObservedObject var viewModel: ProfileViewModel
  
  var body: some View {
    VStack {
      // Avatar
      KFImage.url(URL(string: viewModel.user.profileImageUrl)!)
        .circleImageStyle(size: 120, colorScheme: colorScheme)

      // Name
      Text(viewModel.user.fullname)
        .font(.system(size: 16, weight: .semibold))
        .padding(.top, 8)
      
      // @
      Text("@\(viewModel.user.username)")
        .font(.system(size: 12))
        .foregroundColor(.gray)
      // Bio
      Text("Billionaire by day, dark knight by night.")
        .font(.system(size: 14))
        .padding(.top, 8)
      
      // Stats
      HStack(spacing: 40) {
        VStack {
          Text("\(viewModel.user.stats.followers)")
            .font(.system(size: 16, weight: .bold))
          Text("Followers")
            .font(.system(size: 12))
            .foregroundColor(.gray)
        }
        VStack {
          Text("\(viewModel.user.stats.following)")
            .font(.system(size: 16, weight: .bold))
          Text("Following")
            .font(.system(size: 12))
            .foregroundColor(.gray)
        }
      }
      .padding()
      
      ProfileActionButtonView(viewModel: viewModel)
      
    }
    .padding()
    
  }
}

struct ProfileHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileHeaderView(viewModel: ProfileViewModel(user: MOCK_USER))
  }
}
