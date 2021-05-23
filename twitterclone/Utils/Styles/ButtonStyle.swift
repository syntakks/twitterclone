//
//  ButtonStyle.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/18/21.
//

import SwiftUI

struct EditButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(width: 360, height: 40)
      .background(Color.blue)
      .foregroundColor(.white)
      .cornerRadius(20)
  }
}

struct FollowButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(width: 180, height: 40)
      .background(Color.blue)
      .foregroundColor(.white)
      .cornerRadius(20)
  }
}

struct MessageButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(width: 180, height: 40)
      .background(Color.purple)
      .foregroundColor(.white)
      .cornerRadius(20)
  }
}

struct SignInButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(.headline)
      .foregroundColor(.blue)
      .frame(width: 325, height: 50)
      .background(Color.white)
      .clipShape(Capsule())
      .padding()
  }
}

struct TweetButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding(.horizontal)
      .padding(.vertical, 8)
      .background(Color.blue)
      .foregroundColor(.white)
      .clipShape(Capsule())
  }
}

struct ButtonStyle_Previews: PreviewProvider {
  static var previews: some View {
    VStack(spacing: 40) {
      // Edit
      Button("Edit", action: {})
        .buttonStyle(EditButtonStyle())
      
      // Follow/ Message
      HStack {
        Button("Follow", action: {})
          .buttonStyle(FollowButtonStyle())
        Button("Message", action: {})
          .buttonStyle(MessageButtonStyle())
      }
      // Log In
      VStack {
        Button("Log In", action: {})
          .buttonStyle(SignInButtonStyle())
      }
      .background(Color(#colorLiteral(red: 0.1131996438, green: 0.631419003, blue: 0.9528219104, alpha: 1)))
    }
  }
}
