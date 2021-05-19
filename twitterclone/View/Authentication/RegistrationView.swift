//
//  RegistrationView.swift
//  twitterclone
//
//  Created by Stephen Wall on 5/18/21.
//

import SwiftUI

struct RegistrationView: View {
  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  @EnvironmentObject var viewModel: AuthViewModel
  @State var fullName = ""
  @State var email = ""
  @State var username = ""
  @State var password = ""
  @State var showImagePicker = false
  @State var selectedUIImage: UIImage?
  @State var image: Image?
  
  func loadImage() {
    guard let selectedImage = selectedUIImage else { return }
    image = Image(uiImage: selectedImage)
  }
  
  var body: some View {
    ZStack {
      VStack {
        Button(action: { showImagePicker.toggle() }) {
          ZStack {
            if let image = image {
              image
                .addPhotoImageStyle(usePlaceholder: false)
              
            } else {
              Image("plus_photo")
                .addPhotoImageStyle(usePlaceholder: true)
            }
          }
        }
        .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
          ImagePicker(image: $selectedUIImage)
        }
        
        VStack(spacing: 20) {
          CustomTextField(text: $fullName, placeholder: "Full Name", imageName: "person", isSecure: false)
          CustomTextField(text: $email, placeholder: "Email", imageName: "envelope", isSecure: false)
          CustomTextField(text: $username, placeholder: "Username", imageName: "person", isSecure: false)
          CustomTextField(text: $password, placeholder: "Password", imageName: "lock", isSecure: true)
        }
        
        Button("Sign Up", action: {
          guard let image = selectedUIImage else { return }
          viewModel.registerUser(
            email: email.lowercased(),
            password: password,
            username: username.lowercased(),
            fullname: fullName,
            profileImage: image)
        })
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
