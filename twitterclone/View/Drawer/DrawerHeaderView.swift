//
//  SideMenuHeaderView.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/20/21.
//

import SwiftUI

struct DrawerHeaderView: View {
    var body: some View {
      VStack(alignment: .leading) {
        Image("batman")
          .resizable()
          .scaledToFill()
          .frame(width: 64, height: 64)
          .clipShape(Circle())
        
        Text("Bruce Wayne")
          .font(.system(size: 24, weight: .semibold))
        Text("@batman")
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
          DrawerHeaderView()
            .foregroundColor(.white)
          Spacer()
        }
        
      }
    }
}
