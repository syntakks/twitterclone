//
//  FeedView.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/17/21.
//

import SwiftUI

struct FeedView: View {
  @EnvironmentObject var viewModel: AuthViewModel
  @State var isShowingNewTweetView = false
  
    var body: some View {
      ZStack(alignment: .bottomTrailing) {
        
        ScrollView {
          
          LazyVStack {
            ForEach(0..<100) { item in
              TweetCell()
            }
          }
          
        }
        
        Button(
          action: {
            //isShowingNewTweetView.toggle()
            viewModel.signOut()
          },
          label: {
            Image("tweet")
              .resizable()
              .renderingMode(.template)
              .frame(width: 32, height: 32)
              .padding()
          })
          .background(Color.blue)
          .foregroundColor(.white)
          .clipShape(Circle())
          .padding()
          .fullScreenCover(isPresented: $isShowingNewTweetView) {
            NewTweetView(isPresented: $isShowingNewTweetView)
          }
        
      }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
