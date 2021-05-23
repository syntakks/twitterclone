//
//  CustomTextField.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/18/21.
//

import SwiftUI

struct CustomTextField: View {
  @Binding var text: String
  let placeholder: String
  let imageName: String
  let isSecure: Bool
  
  var body: some View {
    
    VStack {
      ZStack(alignment: .leading) {
        if text.isEmpty {
          Text(placeholder)
            .foregroundColor(Color(.init(white: 1, alpha: 0.87)))
            .padding(.leading, 40)
        }
        
        HStack(spacing: 16) {
          Image(systemName: imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
            .foregroundColor(.white)
          
          TextField("", text: $text)
            .autocapitalization(.none)
            .foregroundColor(.white)
        }
        
      }
      .padding()
      .background(Color(.init(white: 1, alpha: 0.15)))
      .cornerRadius(10)
    }
    .padding(.horizontal, 32)
  }
}

struct CustomTextField_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      HStack { Spacer() }
      CustomTextField(text: .constant(""), placeholder: "Full Name", imageName: "person", isSecure: false)
      CustomTextField(text: .constant(""), placeholder: "Email", imageName: "envelope", isSecure: false)
      CustomTextField(text: .constant(""), placeholder: "Username", imageName: "person", isSecure: false)
      CustomTextField(text: .constant(""), placeholder: "Password", imageName: "lock", isSecure: true)
      Spacer()
    }
    .padding(.top, 88)
    .background(Color(#colorLiteral(red: 0.1131996438, green: 0.631419003, blue: 0.9528219104, alpha: 1)))
    .ignoresSafeArea()
    
  }
}
