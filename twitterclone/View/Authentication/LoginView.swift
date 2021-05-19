//
//  LoginView.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/18/21.
//

import SwiftUI

struct LoginView: View {
  @State var email = ""
  @State var password = ""
  
  var body: some View {
    NavigationView {
      ZStack {
        VStack {
          Image("twitter-logo")
            .resizable()
            .scaledToFill()
            .frame(width: 220, height: 100)
            .padding(.top, 88)
            .padding(.bottom)
          
          VStack(spacing: 24) {
            CustomTextField(text: $email, placeholder: "Email", imageName: "envelope", isSecure: false)
            CustomTextField(text: $password, placeholder: "Password", imageName: "lock", isSecure: true)
          }
          
          HStack {
            Spacer()
            Button(action: {} ) {
              Text("Forgot Password?")
                .font(.footnote)
                .bold()
                .foregroundColor(.white)
                .padding(.top, 16)
                .padding(.trailing, 32)
            }
          }
          
          Button("Sign In", action: {})
            .buttonStyle(SignInButtonStyle())
            .padding()
          
          Spacer()
          
          NavigationLink(
            destination: RegistrationView().navigationBarBackButtonHidden(true),
            label: {
              HStack() {
                Text("Don't have an account?")
                  .font(.system(size: 14))
                Text("Sign Up")
                  .font(.system(size: 14, weight: .semibold))
              }
              .padding(.bottom, 40)
              .foregroundColor(.white)
            })
          
        }
      }
      .background(Color(#colorLiteral(red: 0.1131996438, green: 0.631419003, blue: 0.9528219104, alpha: 1)))
      .ignoresSafeArea()
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
