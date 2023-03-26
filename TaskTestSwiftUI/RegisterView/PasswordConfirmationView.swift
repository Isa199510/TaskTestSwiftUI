//
//  PasswordConfirmationView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct PasswordConfirmationView: View {
    
    
    @Binding var firstname: String
    @Binding var lastname: String
    @Binding var email: String
    
    @State var user = UserModel(firstname: "", lastname: "", email: "", password: "")
    
    @State private var password = ""
    @State private var passwordConfirmation = ""
    
    @State private var showTabBar = false
    
    @State var products = PRODUCTS
    
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
                    if password == passwordConfirmation && password.count > 5 {
                        user = UserModel(firstname: firstname, lastname: lastname, email: email, password: password)
                        UserSettings.shared.users.append(user)
                        showTabBar.toggle()
                    }
                }
                .padding(.horizontal, 40)
                .padding(.top, 50)
                .fullScreenCover(isPresented: $showTabBar) {
                    TabBarView(user: $user, products: $products)
                }
                
                Spacer(minLength: 200)
                
            }
            
        }
    }
}

struct PasswordConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordConfirmationView(firstname: .constant(""), lastname: .constant(""), email: .constant(""))
    }
}

