//
//  LazyView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/23/21.
//

import SwiftUI

struct LazyView<Content: View>: View {
  let build: () -> Content
  init(_ build: @autoclosure @escaping() -> Content) {
    self.build = build
  }
  
  var body: Content {
    build()
  }
}
