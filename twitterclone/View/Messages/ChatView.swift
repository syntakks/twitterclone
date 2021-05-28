//
//  ChatView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct ChatView: View {
  let user: User
  @ObservedObject var viewModel: ChatViewModel
  @State var messageText: String = ""
  
  init(user: User) {
    self.user = user
    self.viewModel = ChatViewModel(user: user)
  }
  
  var body: some View {
    VStack {
      ScrollViewReader { reader in
        ScrollView {
          VStack(alignment: .leading, spacing: 12) {
            ForEach(viewModel.messages) { message in
              MessageView(message: message)
                .id(message.id)
            }
          }
        }
        .onChange(of: viewModel.messages, perform: { value in
          if let lastMessage = viewModel.messages.last {
            reader.scrollTo(lastMessage.id, anchor: .bottom)
          }
        })
        .onAppear {
          NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: .main) { notif in
            if let lastMessage = viewModel.messages.last {
              withAnimation(.easeIn(duration: 0.2)) {
                reader.scrollTo(lastMessage.id, anchor: .bottom)
              }
            }
          }
        }
      }
      MessageInputView(messageText: $messageText, buttonAction: sendMessage)
        
    }
    .navigationTitle(user.username)
  }
  
  func sendMessage() {
    viewModel.sendMessage(messageText)
    messageText = ""
  }
  
}

struct ChatView_Previews: PreviewProvider {
  static var previews: some View {
    ChatView(user: MOCK_USER)
  }
}
