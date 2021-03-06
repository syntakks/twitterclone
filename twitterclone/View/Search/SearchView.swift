//
//  SearchView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct SearchView: View {
  @ObservedObject var viewModel = SearchViewModel(config: .search)
  @State var searchText = ""
  
  var body: some View {
    ScrollView {
      SearchBar(text: $searchText)
      LazyVStack(alignment: .leading) {
        ForEach(getUsers()) { user in
          NavigationLink(
            destination: LazyView(UserProfileView(user: user)),
            label: {
              UserCell(user: user)
            })
        }
      }
      Spacer()
    }
  }
  
  func getUsers() -> [User] {
    searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView()
  }
}
