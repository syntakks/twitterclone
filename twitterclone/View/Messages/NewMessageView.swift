//
//  NewMessageView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct NewMessageView: View {
  @ObservedObject var viewModel = SearchViewModel(config: .newMessage)
  @State var searchText = ""
  @Binding var show: Bool
  @Binding var startChat: Bool
  @Binding var user: User?
  
  var body: some View {
    ScrollView {
      SearchBar(text: $searchText)
      LazyVStack(alignment: .leading) {
        ForEach(getUsers()) { user in
          
          Button(action: {
            self.show.toggle()
            self.startChat.toggle()
            self.user = user
          }) {
            UserCell(user: user)
          }
          
        }
      }
    }
  }
  
  func getUsers() -> [User] {
    searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)
  }
  
}

struct NewMessageView_Previews: PreviewProvider {
  static var previews: some View {
    NewMessageView(show: .constant(true), startChat: .constant(true), user: .constant(MOCK_USER))
  }
}
