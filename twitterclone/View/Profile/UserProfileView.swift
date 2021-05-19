//
//  UserProfileView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct UserProfileView: View {
  @State var selectedFilter: TweetFilterOptions = .tweets
  let user: User
  
  var body: some View {
    ScrollView {
      VStack {
        ProfileHeaderView(user: user)
        FilterButtonView(selectedOption: $selectedFilter)
      }
      
      ForEach(0..<9) { tweet in
        TweetCell()
      }
      
      .navigationTitle("Batman")
    }
  }
}

struct UserProfileView_Previews: PreviewProvider {
  static var previews: some View {
    UserProfileView(user: MOCK_USER)
  }
}
