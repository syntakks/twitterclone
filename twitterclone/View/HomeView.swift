//
//  HomeView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/21/21.
//

import SwiftUI

struct HomeView: View {
  @Binding var isDrawerShowing: Bool
  @State var navTitle = "Home"
  
  var body: some View {
    ZStack {
      TabView(selection: $navTitle) {
        FeedView()
          .tabItem {
            Image(systemName: "house")
            Text("Home")
          }
          .tag("Home")
        
        // Search
        SearchView()
          .tabItem {
            Image(systemName: "magnifyingglass")
            Text("Search")
          }
          .tag("Search")
        
        // Messages
        ConversationsView()
          .tabItem {
            Image(systemName: "envelope")
            Text("Messages")
          }
          .tag("Messages")
        
      }
      // Empty click view overlayed the list for tap gesture.
      if isDrawerShowing {
        Color.orange.opacity(0.5)
        .onTapGesture {
          withAnimation(.spring()) {
            isDrawerShowing.toggle()
          }
        }
      }
      
    }
    .navigationTitle(navTitle)
  }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
      HomeView(isDrawerShowing: .constant(false))
    }
}
