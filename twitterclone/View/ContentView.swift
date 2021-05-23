//
//  ContentView.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/17/21
//

import SwiftUI
import Kingfisher

struct ContentView: View {
  @EnvironmentObject var viewModel: AuthViewModel
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  @State private var isDrawerShowing = false
  
  var body: some View {
    
    // User Logged in
    if viewModel.userSession != nil {
      
      NavigationView {
        
        ZStack {
          if isDrawerShowing {
            DrawerView()
          }
          HomeView(isDrawerShowing: $isDrawerShowing)
            .cornerRadius(isDrawerShowing ? 20 : 10)
            .scaleEffect(isDrawerShowing ? 0.8 : 1)
            .offset(x: isDrawerShowing ? 250 : 0, y: 0)
        }
        .onAppear() {
          isDrawerShowing = false
        }
        .navigationBarTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
          leading:
            Button(action: {
              withAnimation(.spring()) {
                isDrawerShowing.toggle()
              }
            }, label: {
              ZStack {
                Image(systemName: isDrawerShowing ? "xmark" : "line.horizontal.3")
                  .resizable()
                  .scaledToFit()
                  .foregroundColor(getIconColor())
                
              }
              .frame(width: 20, height: 20)
              .foregroundColor(isDrawerShowing ? .red : .black)
            })
        )
      }
      // Login
    } else {
      LoginView()
    }
    
    
  }
  
  func getIconColor() -> Color  {
    if isDrawerShowing {
      return Color.red
    }
    if colorScheme == .dark {
      return .white
    }
    return .black
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(AuthViewModel())
  }
}
