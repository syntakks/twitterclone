//
//  UserCell.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
  @Environment(\.colorScheme) var colorScheme
  let user: User
  
    var body: some View {
      HStack(spacing: 16) {
        KFImage(URL(string: user.profileImageUrl))
          .resizable()
          .scaledToFill()
          .clipped()
          .frame(width: 56, height: 56)
          .clipShape(Circle())
          .padding(.leading)
        
        VStack(alignment: .leading) {
          Text(user.username)
            .font(.system(size: 14, weight: .semibold))
          Text(user.fullname)
            .font(.system(size: 14))
        }
        .foregroundColor(colorScheme == .dark ? .white : .black)
        
        Spacer()
      }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
      UserCell(user: MOCK_USER)
    }
}
