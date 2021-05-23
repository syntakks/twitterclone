//
//  HomeView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/21/21.
//

import SwiftUI

struct HomeView: View {
  @Binding var isDrawerShowing: Bool
  
  var body: some View {
    ZStack {
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
  }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
      HomeView(isDrawerShowing: .constant(false))
    }
}
