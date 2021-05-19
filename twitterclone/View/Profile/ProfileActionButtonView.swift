//
//  ProfileActionButtonView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct ProfileActionButtonView: View {
  let isCurrentUser: Bool
  
  var body: some View {
    if isCurrentUser {
      Button("Edit", action: {})
        .buttonStyle(EditButtonStyle())
    } else {
      HStack {
        Button("Follow", action: {})
          .buttonStyle(FollowButtonStyle())
        Button("Message", action: {})
          .buttonStyle(MessageButtonStyle())
      }
    }
    
  }
}

struct ProfileActionButtonView_Previews: PreviewProvider {
  static var previews: some View {
    VStack(spacing: 40){
      ProfileActionButtonView(isCurrentUser: true)
      ProfileActionButtonView(isCurrentUser: false)
    }
  }
}
