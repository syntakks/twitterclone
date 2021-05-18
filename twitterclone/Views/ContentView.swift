//
//  ContentView.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/17/21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      
      // Feed
      TabView {
        FeedView()
          .tabItem {
            Image(systemName: "house")
            Text("Home")
          }
        
        // Search
        SearchView()
          .tabItem {
            Image(systemName: "magnifyingglass")
            Text("Search")
          }
        
        // Messages
        ConversationsView()
          .tabItem {
            Image(systemName: "envelope")
            Text("Messages")
          }
      }
      .navigationBarTitle("Home")
      .navigationBarTitleDisplayMode(.inline)
        
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView().colorScheme(.dark)
  }
}
