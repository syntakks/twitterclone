//
//  TextStyle.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/18/21...
//

import SwiftUI

extension Text {
  func headerStyle() -> some View {
    self
      .font(.title2)
      .foregroundColor(.black)
      .fontWeight(.black)
      .textCase(.uppercase)
  }
  
  func messageButtonTextStyle() -> some View {
    self
      .frame(width: 180, height: 40)
      .background(Color.purple)
      .foregroundColor(.white)
      .cornerRadius(20)
  }
  
  func schemeStyle(colorScheme: ColorScheme) -> some View {
    self
      .foregroundColor(colorScheme == .dark ? .white : .black)
  }
}

struct TextHeader_Previews: PreviewProvider {
  static var previews: some View {
    Text("Hey I've got a header style!")
      .headerStyle()
  }
}
