//
//  MessageInputView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct MessageInputView: View {
  @Binding var messageText: String
  var buttonAction: () -> Void
  
    var body: some View {
      VStack {
        HStack{Spacer()}.frame(height: 1).background(Color(.systemGray5))
        HStack {
          TextField("Message...", text: $messageText)
            .textFieldStyle(PlainTextFieldStyle())
            .frame(minHeight: 30)
          
          Button(action: buttonAction, label: {
            Text("Send")
          })
        }
        .padding()
      }
      .padding(.top, -8)
    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
      MessageInputView(messageText: .constant(""), buttonAction: {})
    }
}
