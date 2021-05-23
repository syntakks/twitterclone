//
//  NewTweetView.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/18/21.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
  @Environment(\.colorScheme) var colorScheme
  @Binding var isPresented: Bool
  @State var captionText: String = ""
  @ObservedObject var viewModel: UploadTweetViewModel
  
  init(isPresented: Binding<Bool>) {
    self._isPresented = isPresented
    self.viewModel = UploadTweetViewModel(isPresented: isPresented)
  }
  
  var body: some View {
    NavigationView {
      VStack {
        HStack(alignment: .top) {
          KFImage.url(URL(string: AuthViewModel.shared.user!.profileImageUrl)!)
            .circleImageStyle(size: 64, colorScheme: colorScheme)
          TextArea("What's happening?", text: $captionText)
          Spacer()
        }
        .padding()
        Spacer()
      }
      .navigationBarItems(
        leading:
          Button(action: togglePresentation) {
            Text("Cancel")
          },
        trailing:
          Button(action: uploadTweet) {
            Text("Tweet")
          }.buttonStyle(TweetButtonStyle())
      )
    }
  }
  
  func togglePresentation() {
    isPresented.toggle()
  }
  
  func uploadTweet() {
    viewModel.uploadTweet(caption: captionText)
  }
}

struct NewTweetView_Previews: PreviewProvider {
  static var previews: some View {
    NewTweetView(isPresented: .constant(true))
  }
}
