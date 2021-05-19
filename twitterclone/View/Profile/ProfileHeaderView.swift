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
  let viewModel: ProfileViewModel
  @Binding var isFollowed: Bool
  private let options: KingfisherOptionsInfo = [.processor(ResizingImageProcessor(referenceSize: .init(width: 120, height: 120), mode: .aspectFill))]
  
  var body: some View {
    VStack {
      // Avatar
      KFImage.url(URL(string: viewModel.user.profileImageUrl)!)
        .profileImageStyle(colorScheme: colorScheme)

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
          Text("0")
            .font(.system(size: 16, weight: .bold))
          Text("Followers")
            .font(.system(size: 12))
            .foregroundColor(.gray)
        }
        VStack {
          Text("1")
            .font(.system(size: 16, weight: .bold))
          Text("Following")
            .font(.system(size: 12))
            .foregroundColor(.gray)
        }
      }
      .padding()
      
      ProfileActionButtonView(
        viewModel: viewModel,
        isFollowed: $isFollowed)
      
    }
    .padding()
    
  }
}

struct ProfileHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileHeaderView(viewModel: ProfileViewModel(user: MOCK_USER), isFollowed: .constant(false))
  }
}
