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
    
    // User Logged in
    if viewModel.userSession != nil {
      
      NavigationView {
        
        ZStack {
          if isDrawerShowing {
            DrawerView()
          }
          HomeView()
            .cornerRadius(isDrawerShowing ? 20 : 10)
            .scaleEffect(isDrawerShowing ? 0.8 : 1)
            .offset(x: isDrawerShowing ? 250 : 0, y: 0)
        }
//        .onTapGesture {
//          if isDrawerShowing {
//            withAnimation(.spring()) {
//              isDrawerShowing.toggle()
//            }
//          }
//        }
        .navigationBarTitle("Home")
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
      // Login
    } else {
      LoginView()
    }
    
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(AuthViewModel())
  }
}

struct HomeView: View {
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
    }
  }
}
