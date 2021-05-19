//
//  TextStyle.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/18/21.
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
}

struct TextHeader_Previews: PreviewProvider {
  static var previews: some View {
    Text("Hey I've got a header style!")
      .headerStyle()
  }
}
