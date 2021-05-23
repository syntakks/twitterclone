//
//  SideMenuHeaderView.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/20/21.
//

import SwiftUI
import Kingfisher

struct DrawerHeaderView: View {
  @Environment(\.colorScheme) var colorScheme
  @State var user: User
  
    var body: some View {
      VStack(alignment: .leading) {
        KFImage.url(URL(string: user.profileImageUrl)!)
          .circleImageStyle(size: 64, colorScheme: colorScheme)
        
        Text(user.fullname)
          .font(.system(size: 24, weight: .semibold))
        Text("@\(user.username)")
          .font(.system(size: 14))
          .padding(.bottom, 32)
        
        HStack(spacing: 12) {
          HStack(spacing: 4) {
            Text("1234").bold()
            Text("Following")
          }
          HStack(spacing: 4) {
            Text("607").bold()
            Text("Followers")
          }
          Spacer() // Stretch
        }
      }
      .padding()
    }
}

struct DrawerHeaderView_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
          .ignoresSafeArea()
        VStack {
          DrawerHeaderView(user: MOCK_USER)
            .foregroundColor(.white)
          Spacer()
        }
        
      }
    }
}
