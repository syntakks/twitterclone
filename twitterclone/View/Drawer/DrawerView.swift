//
//  SideMenuView.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/20/21.
//

import SwiftUI

struct DrawerView: View {
  @EnvironmentObject var viewModel: AuthViewModel
  
  var body: some View {
    ZStack(alignment: .topLeading) {
      LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea()
      VStack(alignment: .leading) {
        
        if let user = AuthViewModel.shared.user {
          DrawerHeaderView(user: user)
            .foregroundColor(.white)
        }
        
        ForEach(DrawerViewModel.allCases, id: \.self) { option in
          if option == .logout {
            Button(action: {
              viewModel.signOut()
            }, label: {
              DrawerCell(title: option.title, imageName: option.imageName)
            })
          } else {
            NavigationLink(
              destination: Text(option.title),
              label: {
                DrawerCell(title: option.title, imageName: option.imageName)
              })
          }
        }
      }
    }
  }
}

struct DrawerView_Previews: PreviewProvider {
  static var previews: some View {
    DrawerView()
  }
}
