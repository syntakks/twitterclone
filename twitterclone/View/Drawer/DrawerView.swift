//
//  SideMenuView.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/20/21.
//

import SwiftUI

struct DrawerView: View {
  
    var body: some View {
      ZStack(alignment: .topLeading) {
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
          .ignoresSafeArea()
        VStack(alignment: .leading) {
          DrawerHeaderView()
            .foregroundColor(.white)
          
          ForEach(0..<9) { _ in
            DrawerCell()
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
