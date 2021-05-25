//
//  ChatView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct ChatView: View {
  let user: User
  let viewModel: ChatViewModel
  @State var messageText: String = ""
  
  init(user: User) {
    self.user = user
    self.viewModel = ChatViewModel(user: user)
  }
  
  var body: some View {
    VStack {
      ScrollView {
        LazyVStack(alignment: .leading, spacing: 12) {
          ForEach(MOCK_MESSAGES) { message in
            MessageView(message: message)
          }
        }
      }
      MessageInputView(messageText: $messageText)
    }
  }
  
}

struct ChatView_Previews: PreviewProvider {
  static var previews: some View {
    ChatView(user: MOCK_USER)
  }
}
