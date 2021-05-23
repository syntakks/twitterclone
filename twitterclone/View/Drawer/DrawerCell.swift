//
//  SideMenuCell.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/20/21.
//

import SwiftUI

struct DrawerCell: View {
  var title: String
  var imageName: String
  
    var body: some View {
      HStack(spacing: 16) {
        Image(systemName: imageName)
          .frame(width: 30, height: 30)
        Text(title)
          .font(.system(size: 15, weight: .semibold))
      }
      .padding(.vertical, 4)
      .padding(.leading, 25)
      .foregroundColor(.white)
    }
  
  
}

struct SideMenuCell_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
          .ignoresSafeArea()
        VStack {
          ForEach(0..<20) { _ in
            HStack {
              DrawerCell(title: "Profile", imageName: "person")
              Spacer()
            }
          }
        }
      }
          
    }
}
