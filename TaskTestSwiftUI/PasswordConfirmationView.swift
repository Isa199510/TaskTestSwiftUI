//
//  PasswordConfirmationView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct PasswordConfirmationView: View {
    
    @Binding var user: UserModel
    
    @State private var password = ""
    @State private var passwordConfirmation = ""
    
    @State private var showTabBar = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Password confirmation")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(.top, 100)
                
                Spacer()
                
                VStack(spacing: 40) {
                    PasswordFieldView(password: $password)
                    PasswordFieldView(password: $passwordConfirmation)
                }
                .padding(.horizontal, 40)
                
                
                CustomButtonView(title: "Continue") {
                    print(user)
                    if password == passwordConfirmation && !password.isEmpty && !passwordConfirmation.isEmpty {
                        user.password = password
                        userManager.registerUser(user: user)
                        showTabBar.toggle()
                    }
                }
                .padding(.horizontal, 40)
                .padding(.top, 50)
                .fullScreenCover(isPresented: $showTabBar) {
                    TabBarView(user: $user)
                }
                
                Spacer(minLength: 200)
                
            }
            
        }
    }
}

struct PasswordConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordConfirmationView(user: .constant(UserModel(firstname: "", lastname: "", email: "", password: "", cart: getSelectedProducts(), favorites: getSelectedProducts(), latest: getSelectedProducts())))
    }
}

