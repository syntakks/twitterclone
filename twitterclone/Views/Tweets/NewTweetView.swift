//
//  NewTweetView.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/18/21.
//

import SwiftUI

struct NewTweetView: View {
  @Binding var isPresented: Bool
  @State var captionText: String = ""
  
    var body: some View {
      NavigationView {
        VStack {
          HStack(alignment: .top) {
            Image("batman")
              .resizable()
              .scaledToFill()
              .clipped()
              .frame(width: 64, height: 64)
              .cornerRadius(32)
            
            TextArea("What's happening?", text: $captionText)
            
            Spacer()
          }
          .padding()
          Spacer()
        }
        .navigationBarItems(
          leading: Button(
            action: { isPresented.toggle() },
            label: {
            Text("Cancel")
              
          }),
          trailing: Button(
            action: {},
            label: {
            Text("Tweet")
              .padding(.horizontal)
              .padding(.vertical, 8)
              .background(Color.blue)
              .foregroundColor(.white)
              .clipShape(Capsule())
          }))
      }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
      NewTweetView(isPresented: .constant(true))
    }
}
