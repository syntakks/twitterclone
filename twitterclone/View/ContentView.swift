//
//  ContentView.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/17/21
//

import SwiftUI
import Kingfisher

struct ContentView: View {
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  @EnvironmentObject var viewModel: AuthViewModel
  @State private var isDrawerShowing = false
  
  var body: some View {
    Group {
      // User Logged in
      if viewModel.userSession != nil {
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
          .navigationBarItems(
            leading:
              Button(action: {}, label: {
                Image(systemName: "line.horizontal.3.circle")
                  .resizable()
                  .frame(width: 30, height: 30)
                  .padding(.bottom, 8)
                  .foregroundColor(.gray)
              })
          )
          
        }
      } else {
        LoginView()
      }
    }
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(AuthViewModel())
  }
}
