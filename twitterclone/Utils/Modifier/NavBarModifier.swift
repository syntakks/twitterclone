//
//  NavBarModifier.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/21/21.
//

import SwiftUI

struct HiddenNavigationBar: ViewModifier {
  func body(content: Content) -> some View {
    content
      .navigationBarTitle("", displayMode: .inline)
      .navigationBarHidden(true)
  }
}

struct ShowingNavigationBar: ViewModifier {
  @Binding var isDrawerShowing: Bool
  var title: String
  
  func body(content: Content) -> some View {
    content
      .navigationBarTitle(title)
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarItems(
        leading:
          Button(action: {
            withAnimation(.spring()) {
              isDrawerShowing.toggle()
            }
          }, label: {
            Image(systemName: "line.horizontal.3.circle")
              .resizable()
              .frame(width: 30, height: 30)
              .padding(.bottom, 8)
              .foregroundColor(.gray)
          })
      )
  }
}

extension View {
  func hiddenNavigationBarStyle() -> some View {
    modifier(HiddenNavigationBar())
  }
  
  func showingNavigationBarStyle(title: String, isDrawerShowing: Binding<Bool>) -> some View {
    modifier(ShowingNavigationBar(isDrawerShowing: isDrawerShowing, title: title))
  }
}
