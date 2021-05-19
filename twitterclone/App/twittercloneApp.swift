//
//  twittercloneApp.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/17/21.
//

import SwiftUI
import Firebase

@main
struct twittercloneApp: App {
  
  init() {
    FirebaseApp.configure()
  }
  
  var body: some Scene {
    WindowGroup {
      //ContentView()
      LoginView()
    }
  }
}
