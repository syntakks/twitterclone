//
//  ConversationCell.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
  @Environment(\.colorScheme) var colorScheme
  var user: User
  var message: Message
  
    var body: some View {
      VStack(alignment: .leading) {
        HStack(spacing: 16) {
          KFImage.url(URL(string: user.profileImageUrl)!)
            .circleImageStyle(size: 56, colorScheme: colorScheme)
          
          VStack(alignment: .leading, spacing: 4) {
            Text(user.username)
              .font(.system(size: 14, weight: .semibold))
            
            Text(message.text)
              .font(.system(size: 14))
              .lineLimit(2)
              .fixedSize(horizontal: false, vertical: true)
          }
          .foregroundColor(colorScheme == .dark ? .white : .black)
          .padding(.trailing, 8)
        }
        Divider()
      }
      .padding(.top, 4)
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
      ConversationCell(user: MOCK_USER, message: MOCK_MESSAGE)
    }
}
