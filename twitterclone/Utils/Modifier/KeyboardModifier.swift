//
//  KeyboardModifier.swift
//  twitterclone
//
//  Created by Steve Wall on 5/27/21.
//

import SwiftUI
import Combine

struct AdaptsToKeyboard: ViewModifier {
  @State var currentHeight: CGFloat = 0
  
  func body(content: Content) -> some View {
    GeometryReader { geometry in
      content
        .padding(.bottom, self.currentHeight)
        .onAppear(perform: {
          NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillShowNotification)
            .merge(with: NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillChangeFrameNotification))
            .compactMap { notification in
              withAnimation(.easeOut(duration: 0.16)) {
                notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
              }
            }
            .map { rect in
              rect.height - geometry.safeAreaInsets.bottom
            }
            .subscribe(Subscribers.Assign(object: self, keyPath: \.currentHeight))
          
          NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillHideNotification)
            .compactMap { notification in
              CGFloat.zero
            }
            .subscribe(Subscribers.Assign(object: self, keyPath: \.currentHeight))
        })
    }
  }
}

extension View {
  func adaptsToKeyboard() -> some View {
    return modifier(AdaptsToKeyboard())
  }
}


// MARK: - Modifier solution.

struct KeyboardResponsiveModifier: ViewModifier {
  @State private var offset: CGFloat = 0
  
  func body(content: Content) -> some View {
    content
      .padding(.bottom, offset)
      .onAppear {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notif in
          let value = notif.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
          let height = value.height
          let bottomInset = UIApplication.shared.windows.first?.safeAreaInsets.bottom
          self.offset = height - (bottomInset ?? 0)
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { notif in
          self.offset = 0
        }
      }
  }
}

extension View {
  func keyboardResponsive() -> ModifiedContent<Self, KeyboardResponsiveModifier> {
    return modifier(KeyboardResponsiveModifier())
  }
}
