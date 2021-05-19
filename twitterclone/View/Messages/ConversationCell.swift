//
//  ConversationCell.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct ConversationCell: View {
  @Environment(\.colorScheme) var colorScheme
  
    var body: some View {
      VStack(alignment: .leading) {
        HStack(spacing: 16) {
          Image("venom")
            .resizable()
            .scaledToFill()
            .clipped()
            .frame(width: 56, height: 56)
            .clipShape(Circle())
            .padding(.leading)
          
          VStack(alignment: .leading, spacing: 4) {
            Text("venom")
              .font(.system(size: 14, weight: .semibold))
            
            Text("Longer message text to see what happens when I do this...")
              .font(.system(size: 14))
              .lineLimit(2)
              .fixedSize(horizontal: false, vertical: true)
          }
          .foregroundColor(colorScheme == .dark ? .white : .black)
          .padding(.trailing, 8)
        }
        Divider()
      }
      .padding(.top, 4)
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
