//
//  NewMessageView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct NewMessageView: View {
  @ObservedObject var viewModel = SearchViewModel()
  @State var searchText = ""
  @Binding var show: Bool
  @Binding var startChat: Bool
  
  var body: some View {
    ScrollView {
      SearchBar(text: $searchText)
      LazyVStack(alignment: .leading, spacing: 0) {
        ForEach(viewModel.users) { user in
          
          Button(action: {
            self.show.toggle()
            self.startChat.toggle()
          }) {
            UserCell(user: user)
          }
          
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
