//
//  ProfileHeaderView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct ProfileHeaderView: View {
  @Environment(\.colorScheme) var colorSheme
  
  var body: some View {
    VStack {
      // Avatar
      Image("batman")
        .resizable()
        .scaledToFill()
        .frame(width: 120, height: 120)
        .clipShape(Circle())
        .shadow(color:colorSheme == .dark ? .white : .black, radius: 5, x: 0, y: 0)
      
      // Name
      Text("Bruce Wayne")
        .font(.system(size: 16, weight: .semibold))
        .padding(.top, 8)
      
      // @
      Text("@batman")
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
    ProfileHeaderView()
  }
}
