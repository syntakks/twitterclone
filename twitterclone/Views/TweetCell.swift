//
//  TweetCell.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/17/21.
//

import SwiftUI

struct TweetCell: View {
    var body: some View {
      VStack {
        HStack(alignment: .top) {
          Image("batman")
            .resizable()
            .scaledToFit()
            .clipped()
            .frame(width: 56, height: 56)
            .clipShape(Circle())
            .padding(.leading)
          
          VStack(alignment: .leading, spacing: 4) {
            HStack {
              Text("Bruce Wayne")
                .font(.system(size: 14, weight: .semibold))
              Group {
                Text("@batman •")
                Text("2w")
              }
              .foregroundColor(.gray)
            }
            
            Text("It's not who I am underneath, but what I do that defines me")
          }
          
        }
        .padding(.bottom)
        .padding(.trailing)
        
        HStack {

          Button(
            action: {},
            label: {
              Image(systemName: "bubble.left")
                .font(.system(size: 16))
                .frame(width:32, height: 32)
            })
          
          Spacer()
          
          Button(
            action: {},
            label: {
              Image(systemName: "arrow.2.squarepath")
                .font(.system(size: 16))
                .frame(width:32, height: 32)
            })
          
          Spacer()
          
          Button(
            action: {},
            label: {
              Image(systemName: "heart.fill")
                .foregroundColor(.red)
                .font(.system(size: 16))
                .frame(width:32, height: 32)
            })
          
          Spacer()
          
          Button(
            action: {},
            label: {
              Image(systemName: "bookmark")
                .font(.system(size: 16))
                .frame(width:32, height: 32)
            })
        }
        .padding(.horizontal)
        .foregroundColor(.gray)
        
        Divider()
      }
    }
}

struct TweetCell_Previews: PreviewProvider {
    static var previews: some View {
        TweetCell()
    }
}
