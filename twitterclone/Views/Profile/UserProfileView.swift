//
//  UserProfileView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

struct UserProfileView: View {
  @State var selectedFilter: TweetFilterOptions = .tweets
  
  var body: some View {
    ScrollView {
      VStack {
        ProfileHeaderView()
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
    UserProfileView()
  }
}
