//
//  RegistrationView.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/18/21.
//

import SwiftUI

struct RegistrationView: View {
  @State var fullName = ""
  @State var email = ""
  @State var username = ""
  @State var password = ""
  @State var showImagePicker = false
  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  
  var body: some View {
    ZStack {
      VStack {
        Button(action: { showImagePicker.toggle() }) {
          Image("plus_photo")
            .resizable()
            .renderingMode(.template)
            .foregroundColor(.white)
            .scaledToFill()
            .frame(width: 140, height: 140)
            .padding(.top, 88)
            .padding(.bottom)
        }
        .sheet(isPresented: $showImagePicker) {
          ImagePicker()
        }
        
        VStack(spacing: 20) {
          CustomTextField(text: $fullName, placeholder: "Full Name", imageName: "person", isSecure: false)
          CustomTextField(text: $email, placeholder: "Email", imageName: "envelope", isSecure: false)
          CustomTextField(text: $username, placeholder: "Username", imageName: "person", isSecure: false)
          CustomTextField(text: $password, placeholder: "Password", imageName: "lock", isSecure: true)
        }
        
        Button("Sign Up", action: {})
          .buttonStyle(SignInButtonStyle())
          .padding()
        
        Spacer()
        
        Button(action: { mode.wrappedValue.dismiss() }) {
          HStack() {
            Text("Already have an account?")
              .font(.system(size: 14))
            Text("Sign In")
              .font(.system(size: 14, weight: .semibold))
          }
          .padding(.bottom, 40)
          .foregroundColor(.white)
        }
        
      }
    }
    .background(Color(#colorLiteral(red: 0.1131996438, green: 0.631419003, blue: 0.9528219104, alpha: 1)))
    .ignoresSafeArea()
  }
  
  
}

struct RegistrationView_Previews: PreviewProvider {
  static var previews: some View {
    RegistrationView()
  }
}
