//
//  FilterButtonView.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import SwiftUI

enum TweetFilterOptions: Int, CaseIterable {
  case tweets
  case replies
  case likes
  
  var title: String {
    switch self {
    case .tweets: return "Tweets"
    case .replies: return "Tweets & Replies"
    case .likes: return "Likes"
    }
  }
}

struct FilterButtonView: View {
  @Binding var selectedOption: TweetFilterOptions
  private let underlineWidth = UIScreen.main.bounds.width / CGFloat(TweetFilterOptions.allCases.count)
  
  private var padding: CGFloat {
    let rawValue = CGFloat(selectedOption.rawValue)
    return (underlineWidth * rawValue) + 16
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        ForEach(TweetFilterOptions.allCases, id: \.self) { option in
          Button(
            action: {
              self.selectedOption = option
            },
            label: {
              Text(option.title)
                .font(.system(size: 14))
                .frame(width: underlineWidth - 8)
            })
        }
      }
      
      Rectangle()
        .frame(width: underlineWidth - 32, height: 3, alignment: .center)
        .foregroundColor(.blue)
        .animation(.spring())
        .padding(.leading, padding)
      
    }
  }
}

struct FilterButtonView_Previews: PreviewProvider {
  static var previews: some View {
    FilterButtonView(selectedOption: .constant(.tweets))
  }
}
