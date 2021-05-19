//
//  ImageStyle.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/18/21.
//

import SwiftUI
import Kingfisher

extension Image {
  func profileImageStyle(colorScheme: ColorScheme) -> some View {
    self
      .resizable()
      .scaledToFill()
      .frame(width: 120, height: 120)
      .clipShape(Circle())
      .shadow(color:colorScheme == .dark ? .white : .black, radius: 5, x: 0, y: 0)
  }
  
  func addPhotoImageStyle(usePlaceholder: Bool) -> some View {
    self
      .resizable()
      .renderingMode(usePlaceholder ? .template : .none)
      .foregroundColor(usePlaceholder ? .white : .clear)
      .scaledToFill()
      .frame(width: 140, height: 140)
      .cornerRadius(usePlaceholder ? 0 : 70)
      .padding(.top, 88)
      .padding(.bottom)
  }
}

extension KFImage {
  
  func profileImageStyle(colorScheme: ColorScheme) -> some View {
    self
      .setProcessor(
        ResizingImageProcessor(
          referenceSize: .init(width: 120, height: 120),
          mode: .aspectFill)
      )
      .clipShape(Circle())
      .shadow(color:colorScheme == .dark ? .white : .black, radius: 5, x: 0, y: 0)
  }
  
  func userCellImageStyle(colorScheme: ColorScheme) -> some View {
    self
      .setProcessor(
        ResizingImageProcessor(
          referenceSize: .init(width: 56, height: 56),
          mode: .aspectFill)
      )
      .clipShape(Circle())
      .shadow(color:colorScheme == .dark ? .white : .black, radius: 5, x: 0, y: 0)
      .padding(.leading)
  }
  
}
