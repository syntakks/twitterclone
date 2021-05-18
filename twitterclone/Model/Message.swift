//
//  Message.swift
//  twitterclone
//
//  Created by Steve Wall on 5/17/21.
//

import Foundation

struct MockMessage: Identifiable {
  let id: Int
  let imageName: String
  let messageText: String
  let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
  .init(id: 0, imageName: "venom", messageText: "Hey how have you been?", isCurrentUser: false),
  .init(id: 1, imageName: "batman", messageText: "Not too bad how about you?", isCurrentUser: true),
  .init(id: 2, imageName: "venom", messageText: "I'm getting hungry", isCurrentUser: false),
  .init(id: 3, imageName: "batman", messageText: "What are you in the mood for?", isCurrentUser: true),
  .init(id: 4, imageName: "venom", messageText: "That person over there is looking pretty tasty...", isCurrentUser: false),
  .init(id: 5, imageName: "batman", messageText: "We've been over this...", isCurrentUser: true),
  .init(id: 6, imageName: "venom", messageText: "Yeah, yeah, yeah.... don't eat the citizens...", isCurrentUser: false),
  .init(id: 7, imageName: "batman", messageText: "It's really not that hard of a concept to follow", isCurrentUser: true),
  .init(id: 8, imageName: "venom", messageText: "Speak for yourself, humans is fire", isCurrentUser: false),
  .init(id: 9, imageName: "batman", messageText: "You're disgusting", isCurrentUser: true),
  .init(id: 10, imageName: "venom", messageText: "Don't knock it until you've tried it!", isCurrentUser: false),
  .init(id: 11, imageName: "batman", messageText: "...", isCurrentUser: true),
  .init(id: 12, imageName: "venom", messageText: "Hey how have you been?", isCurrentUser: false),
  .init(id: 13, imageName: "batman", messageText: "Not too bad how about you?", isCurrentUser: true),
  .init(id: 14, imageName: "venom", messageText: "I'm getting hungry", isCurrentUser: false),
  .init(id: 15, imageName: "batman", messageText: "What are you in the mood for?", isCurrentUser: true),
  .init(id: 16, imageName: "venom", messageText: "That person over there is looking pretty tasty...", isCurrentUser: false),
  .init(id: 17, imageName: "batman", messageText: "We've been over this...", isCurrentUser: true),
  .init(id: 18, imageName: "venom", messageText: "Yeah, yeah, yeah.... don't eat the citizens...", isCurrentUser: false),
  .init(id: 19, imageName: "batman", messageText: "It's really not that hard of a concept to follow", isCurrentUser: true),
  .init(id: 20, imageName: "venom", messageText: "Speak for yourself, humans is fire", isCurrentUser: false),
  .init(id: 21, imageName: "batman", messageText: "You're disgusting", isCurrentUser: true),
  .init(id: 22, imageName: "venom", messageText: "Don't knock it until you've tried it!", isCurrentUser: false),
  .init(id: 23, imageName: "batman", messageText: "...", isCurrentUser: true),
]
