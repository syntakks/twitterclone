//
//  ChatBubble.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct ChatBubbleShape: Shape {
  var isFromCurrentUser: Bool
  
  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(
      roundedRect: rect,
      byRoundingCorners: [.topLeft, .topRight, isFromCurrentUser ? .bottomLeft : .bottomRight],
      cornerRadii: CGSize(width: 16, height: 16))
    return Path(path.cgPath)
  }
}

struct ChatBubbleShape_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubbleShape(isFromCurrentUser: false)
    }
}
