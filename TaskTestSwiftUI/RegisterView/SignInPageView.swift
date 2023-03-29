//
//  SignInPageView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct SignInPageView: View {
        
    @State private var isSecure = true
    
    @State private var showLogIn = false
    @State private var showPasswordConfirmation = false
    
    @State private var firstNameText = ""
    @State private var lastNameText = ""
    @State private var email = ""
    
    @State private var user = UserModel(firstname: "", lastname: "", email: "", password: "")
    
    @State private var textError = ""
    @State private var showTextError = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                
                Text("Sign in")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(.bottom, 70)
                
                VStack(spacing: 30) {
                    TextFieldView(text: $firstNameText, placeholder: "First name")
                    TextFieldView(text: $lastNameText, placeholder: "Last name")
                    TextFieldView(text: $email, placeholder: "Email")
                    
                    CustomButtonView(title: "Sign in") {
                        if firstNameText.count >= 3 && lastNameText.count >= 3 && email.isValidEmail() {
                            if !UserSettings.shared.users.contains(where: {$0.email == email}) {
                                showPasswordConfirmation.toggle()
                            } else {
                                showTextError = true
                                textError = "such a user is already in the database"
                            }
                        } else {
                            showTextError = true
                            textError = "incorrect mail format"
                        }
                    }
                    .fullScreenCover(isPresented: $showPasswordConfirmation) {
                        PasswordConfirmationView(firstname: $firstNameText, lastname: $lastNameText, email: $email)
                    }
                    
                }
                .padding(.horizontal, 30)
                
                HStack {
                    Text("Already have an account?")
                        .foregroundColor(Color(red: 155/255, green: 155/255, blue: 155/255))
                    
                    Button(action: { showLogIn.toggle() }) {
                        Text("Log in")
                    }
                    .fullScreenCover(isPresented: $showLogIn) {
                        LogInView()
                    }
                    Spacer()
                    
                }
                .padding(.horizontal, 30)
                .font(.caption)
                
                Text(textError)
                    .foregroundColor(.red)
                    .font(.caption)
                    .opacity(showTextError ? 1 : 0)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 40) {
                    Button {
                        //action
                        UserDefaults.standard.removeObject(forKey: "users")
                    } label: {
                        Image("googleIcon")
                        Text("Sign in with Google")
                    }
                    
                    Button {
                        // action
                    } label: {
                        Image("appleIcon")
                        Text("Sign in with Apple")
                    }
                }
                .foregroundColor(.black)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 250/255, green: 249/255, blue: 255/255))
            .edgesIgnoringSafeArea(.all)
        }
        
    }
}

struct SignInPageView_Previews: PreviewProvider {
    static var previews: some View {
        SignInPageView()
            .background(Color(red: 255/255, green: 0, blue: 0))
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("Sing in")
    }
}


