//
//  SearchView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct SearchView: View {
  @State var searchText = ""
    var body: some View {
      ScrollView {
        SearchBar(text: $searchText)
        LazyVStack(alignment: .leading) {
          ForEach(0..<10) { item in
            NavigationLink(
              destination: UserProfileView(),
              label: {
                UserCell()
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
