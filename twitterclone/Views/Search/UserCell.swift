//
//  UserCell.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct UserCell: View {
  @Environment(\.colorScheme) var colorScheme
  
    var body: some View {
      HStack(spacing: 16) {
        Image("venom")
          .resizable()
          .scaledToFill()
          .clipped()
          .frame(width: 56, height: 56)
          .clipShape(Circle())
          .padding(.leading)
        
        VStack(alignment: .leading) {
          Text("venom")
            .font(.system(size: 14, weight: .semibold))
          Text("Eddie Brock")
            .font(.system(size: 14))
        }
        .foregroundColor(colorScheme == .dark ? .white : .black)
        
        Spacer()
      }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
