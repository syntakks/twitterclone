//
//  ChatBubble.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct MessageView: View {
  @Environment(\.colorScheme) var colorScheme
  let message: MockMessage
  
  var body: some View {
    HStack(alignment: .bottom) {
      if message.isCurrentUser {
        Spacer()
      } else {
        Image(message.imageName)
          .resizable()
          .scaledToFill()
          .clipped()
          .frame(width: 40, height: 40)
          .clipShape(Circle())
      }
      Text(message.messageText)
        .padding()
        .background(message.isCurrentUser ? Color.blue : Color(.systemGray5))
        .clipShape(ChatBubbleShape(isFromCurrentUser: message.isCurrentUser))
        .foregroundColor(message.isCurrentUser ? .white : colorScheme == .dark ? .white : .black)
    }
    .padding(.leading, 8)
    .padding(.trailing, 12)
  }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
      MessageView(message: MOCK_MESSAGES[0])
    }
}
