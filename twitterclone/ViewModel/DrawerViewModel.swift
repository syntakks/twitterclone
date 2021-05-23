//
//  DrawerViewModel.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/20/21.
//

import Foundation

enum DrawerViewModel: Int, CaseIterable {
  case profile
  case lists
  case bookmarks
  case messages
  case notifications
  case logout
  
  var title: String {
    switch self {
    case .profile: return "Profile"
    case .lists: return "Lists"
    case .bookmarks: return "Bookmarks"
    case .messages: return "Messages"
    case .notifications: return "Notifications"
    case .logout: return "Logout"
    }
  }
  
  var imageName: String {
    switch self {
    case .profile: return "person"
    case .lists: return "list.bullet"
    case .bookmarks: return "bookmark"
    case .messages: return "bubble.left"
    case .notifications: return "bell"
    case .logout: return "arrow.left.square"
    }
  }
}
