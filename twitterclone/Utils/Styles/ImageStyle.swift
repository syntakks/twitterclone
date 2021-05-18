//
//  ImageStyle.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/18/21.
//

import SwiftUI

extension Image {
  func profileImageStyle(colorScheme: ColorScheme) -> some View {
    self
      .resizable()
      .scaledToFill()
      .frame(width: 120, height: 120)
      .clipShape(Circle())
      .shadow(color:colorScheme == .dark ? .white : .black, radius: 5, x: 0, y: 0)
  }
}
