//
//  ConversationsView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct ConversationsView: View {
  @State var isShowingNewMessageView = false
  @State var showChat = false
  
    var body: some View {
      ZStack(alignment: .bottomTrailing) {
        
        NavigationLink(
          destination: ChatView(user: MOCK_USER),
          isActive: $showChat,
          label: {})
        
        ScrollView {
          
          LazyVStack() {
            ForEach(0..<100) { item in
              NavigationLink(
                destination: ChatView(user: MOCK_USER),
                label: {
                  ConversationCell()
                })
            }
          }
          
        }
        
        Button(
          action: { isShowingNewMessageView.toggle() },
          label: {
            Image(systemName: "envelope")
              .resizable()
              .scaledToFit()
              .frame(width: 32, height: 32)
              .padding()
          })
          .background(Color.blue)
          .foregroundColor(.white)
          .clipShape(Circle())
          .padding()
          .sheet(isPresented: $isShowingNewMessageView) {
            NewMessageView(show: $isShowingNewMessageView, startChat: $showChat)
          }
        
      }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
      ConversationsView()
    }
}
