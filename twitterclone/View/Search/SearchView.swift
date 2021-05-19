//
//  SearchView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct SearchView: View {
  @ObservedObject var viewModel = SearchViewModel()
  @State var searchText = ""
  
    var body: some View {
      ScrollView {
        SearchBar(text: $searchText)
        LazyVStack(alignment: .leading) {
          ForEach(viewModel.users) { user in
            NavigationLink(
              destination: UserProfileView(user: user),
              label: {
                UserCell(user: user)
              })
          }
        }
      }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
