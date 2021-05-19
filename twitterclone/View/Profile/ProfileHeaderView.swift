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
  let user: User
  
  var body: some View {
    VStack {
      // Avatar
      KFImage(URL(string: user.profileImageUrl))
        .profileImageStyle(colorScheme: colorScheme)
      
      // Name
      Text(user.fullname)
        .font(.system(size: 16, weight: .semibold))
        .padding(.top, 8)
      
      // @
      Text("@\(user.username)")
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
      
      ProfileActionButtonView(isCurrentUser: false)
      
    }
    .padding()
    
  }
}

struct ProfileHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileHeaderView(user: MOCK_USER)
  }
}
