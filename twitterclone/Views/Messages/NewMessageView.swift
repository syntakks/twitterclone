//
//  NewMessageView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct NewMessageView: View {
  @State var searchText = ""
  @Binding var show: Bool
  @Binding var startChat: Bool
  
  var body: some View {
    ScrollView {
      SearchBar(text: $searchText)
      LazyVStack(alignment: .leading) {
        ForEach(0..<10) { item in
          Button(
            action: {
              self.show.toggle()
              self.startChat.toggle()
            },
            label: {
              UserCell()
            })
        }
      }
    }
  }
}

struct NewMessageView_Previews: PreviewProvider {
  static var previews: some View {
    NewMessageView(show: .constant(true), startChat: .constant(true))
  }
}
