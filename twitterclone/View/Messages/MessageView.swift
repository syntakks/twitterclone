//
//  ChatBubble.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI
import Kingfisher

struct MessageView: View {
  @Environment(\.colorScheme) var colorScheme
  let message: Message
  
  
  var body: some View {
    HStack(alignment: .bottom) {
      if message.isFromCurrentUser {
        Spacer()
      } else {
        KFImage.url(URL(string: message.user.profileImageUrl)!)
          .circleImageStyle(size: 40, colorScheme: colorScheme)
      }
      Text(message.text)
        .padding()
        .background(message.isFromCurrentUser ? Color.blue : Color(.systemGray5))
        .clipShape(ChatBubbleShape(isFromCurrentUser: message.isFromCurrentUser))
        .foregroundColor(message.isFromCurrentUser ? .white : colorScheme == .dark ? .white : .black)
        .padding(message.isFromCurrentUser ? .leading : .trailing, message.isFromCurrentUser ? CGFloat(100) : CGFloat(50))
    }
    .padding(.leading, 8)
    .padding(.trailing, 12)
  }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
      MessageView(message: MOCK_MESSAGE)
    }
}
