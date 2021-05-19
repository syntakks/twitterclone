//
//  ViewModifier.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/18/21.
//

import SwiftUI

extension View {
  /// This function will only add modifiers to views while running on iOS devices
  func iOS<Content: View>(_ modifier: (Self) -> Content) -> some View {
    #if os(iOS)
    return modifier(self)
    #else
    return self
    #endif
  }
  
  /// This function will only add modifiers to views while running on macOS devices
  func macOS<Content: View>(_ modifier: (Self) -> Content) -> some View {
    #if os(macOS)
    return modifier(self)
    #else
    return self
    #endif
  }
  
  /// This function will only add modifiers to views while running on watchOS devices
  func watchOS<Content: View>(_ modifier: (Self) -> Content) -> some View {
    #if os(watchOS)
    return modifier(self)
    #else
    return self
    #endif
  }
}

struct ViewModifier_Previews: PreviewProvider {
  static var previews: some View {
    Text("This will look different on every platform")
      .iOS { $0.foregroundColor(.green) }
      .macOS { $0.foregroundColor(.blue) }
      .watchOS { $0.foregroundColor(.red) }
  }
}
